class Upload < Sequel::Model
  many_to_one :user
  many_to_one :sound

  def self.create_for(user, attrs, sound_attrs)
    db.transaction do
      create(attrs) do |upload|
        upload.sound    = Sound.create(sound_attrs)
        upload.user     = user
        upload.location = 'this/is/temporary'
      end
    end
  end

  def validate
    super
    validates_presence :location
    validates_unique   :sound_id
  end
end
