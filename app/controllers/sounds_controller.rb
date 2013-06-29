class SoundsController < ApplicationController
  def show
    @sound  = Sound[params[:id]]
    @upload = @sound.upload
  end

  def new
    @sound = Sound.new
  end

  def create
    sound_attrs = params[:sound]
    file        = sound_attrs.delete(:file)

    uploader = SoundUploader.new(file, viewer, sound_attrs)

    if uploader.valid?
      uploader.upload!
      redirect_to uploads_path
    else
      @sound = uploader.sound
      render :new
    end
  end

  def download
    sound  = Sound[params[:id]]
    upload = sound.upload
    file   = upload.file

    send_data file, filename: sound.title, type: upload.content_type
  end
end
