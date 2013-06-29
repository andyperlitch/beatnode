require 'active_model'

class SoundUploader
  include ActiveModel::Validations

  attr_reader :file, :user, :upload, :sound

  validate :valid_sound

  def initialize(file, user, sound_attrs)
    @file   = file
    @user   = user
    @upload = Upload.new
    @sound  = Sound.new(sound_attrs)
  end

  def upload!
    Upload.db.transaction do
      sound.save

      sha1 = Beatnode::Storage.store!(file.tempfile)

      upload.sha1         = sha1
      upload.content_type = file.content_type
      upload.sound        = sound
      upload.user         = user
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
