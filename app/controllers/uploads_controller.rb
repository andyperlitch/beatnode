class UploadsController < ApplicationController
  def new
    @upload = Upload.new
  end

  def create
    upload_attrs = params[:upload]
    sound_attrs  = upload_attrs.delete(:sound)

    uploader = SoundUploader.new(viewer, upload_attrs, sound_attrs)

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
