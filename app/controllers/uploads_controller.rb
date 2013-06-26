class UploadsController < ApplicationController
  def new
    @upload = Upload.new
  end

  def create
    upload_attrs = params[:upload]
    sound_attrs  = upload_attrs.delete(:sound)
    file         = upload_attrs.delete(:file).tempfile

    uploader = SoundUploader.new(file, viewer, upload_attrs, sound_attrs)

    if uploader.valid?
      uploader.upload!
      redirect_to uploads_path
    else
      @upload = uploader.upload
      @errors = uploader.errors.full_messages
      render :new
    end
  end
end
