class User < Sequel::Model
  one_to_many :uploaded_sounds, class: :Sound, key: :uploader_id

  many_to_many :followers, class: :User,
    left_key:   :subject_id,
    right_key:  :source_id,
    join_table: :collaborations

  many_to_many :following, class: :User,
    left_key:   :source_id,
    right_key:  :subject_id,
    join_table: :collaborations

  def self.find_or_create_from_auth(auth_hash)
    auth = Auth.from_hash(auth_hash)
    prov, id = auth.provider_name, auth.provider_id

    find_or_create(provider_name: prov, provider_id: id) do |u|
      u.username = auth.username
    end
  end

  def build_sound(params={})
    Sound.new(params).tap do |sound|
      sound.uploader = self
    end
  end

  def crate
    @crate ||= Crate.new(self)
  end

  def recent_uploads
    uploaded_sounds_dataset.recent
  end
end
