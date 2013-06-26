require 'active_model'

class SoundUploader
  include ActiveModel::Validations

  attr_reader :file, :user, :upload, :sound

  validate :valid_sound

  def initialize(file, user, upload_attrs, sound_attrs)
    @file   = file
    @user   = user
    @upload = Upload.new(upload_attrs)
    @sound  = Sound.new(sound_attrs)
  end

  def upload!
    Upload.db.transaction do
      sound.save

      sha1 = Beatnode::Storage.store!(file)

      upload.sha1  = sha1
      upload.sound = sound
      upload.user  = user
      upload.save

      user.crate.add(sound)
    end
  end

  private

  def valid_sound
    unless sound.valid?
      sound.errors.full_messages.each do |msg|
        errors.add(:sound, msg)
      end
    end
  end
end
