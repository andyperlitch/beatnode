require 'active_model'

class SoundUploader
  include ActiveModel::Validations

  attr_reader :user, :upload, :sound

  validate :valid_upload
  validate :valid_sound

  def initialize(user, upload_attrs, sound_attrs)
    @user   = user
    @upload = Upload.new(upload_attrs)
    @sound  = Sound.new(sound_attrs)

    # NOTE: this is temporary until filename generation is implemented
    @upload.location = 'some/filename'
  end

  def upload!
    Upload.db.transaction do
      sound.save

      upload.sound = sound
      upload.user  = user
      upload.save

      user.crate.add(sound)
    end
  end

  private

  def valid_upload
    unless upload.valid?
      upload.errors.full_messages.each do |msg|
        errors.add(:upload, msg)
      end
    end
  end

  def valid_sound
    unless sound.valid?
      sound.errors.full_messages.each do |msg|
        errors.add(:sound, msg)
      end
    end
  end
end
