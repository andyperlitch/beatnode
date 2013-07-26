class SoundsController < ApplicationController
  def show
    sound = Sound[params[:id]]
    render json: json(sound)
  end

  def create
    sound_attrs = params[:sound]
    file        = sound_attrs.delete(:file)

    uploader = SoundUploader.new(file, viewer, sound_attrs)
    sound    = uploader.sound

    if uploader.valid?
      uploader.upload!
      render json: json(sound), status: 201
    else
      @sound = uploader.sound
      head 400
    end
  end

  def download
    sound  = Sound[params[:id]]
    upload = sound.upload
    file   = upload.file

    send_data file, filename: sound.title, type: upload.content_type
  end

  private

  def json(sound)
    SoundPresenter.new(sound).json
  end
end
