class UploadsController < ApplicationController
  def new
    @upload = Upload.new
  end

  def create
    sound_attrs = params[:upload].delete(:sound)

    Upload.create_for(viewer, params[:upload], sound_attrs)

    redirect_to uploads_path
  end
end
