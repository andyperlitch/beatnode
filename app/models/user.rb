class User < Sequel::Model
  one_to_many :uploads

  many_to_many :uploaded_sounds, class:      :Sound,
                                 right_key:  :sound_id,
                                 join_table: :uploads

  many_to_many :followers, class:      :User,
                           left_key:   :subject_id,
                           right_key:  :source_id,
                           join_table: :collaborations

  many_to_many :following, class:      :User,
                           left_key:   :source_id,
                           right_key:  :subject_id,
                           join_table: :collaborations

  def self.find_or_create_from_auth(auth)
    prov, id = auth.provider_name, auth.provider_id

    find_or_create(provider_name: prov, provider_id: id) do |u|
      u.username = auth.username
    end
  end

  def crate
    @crate ||= Crate.new(self)
  end
end
