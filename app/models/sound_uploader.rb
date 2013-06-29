class SoundUploader
  attr_reader :file, :user, :upload, :sound

  def initialize(file, user, sound_attrs)
    @file   = file
    @user   = user
    @upload = Upload.new
    @sound  = Sound.new(sound_attrs)
  end

  def valid?
    sound.valid?
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
end
