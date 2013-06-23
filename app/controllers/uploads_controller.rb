class UploadsController < ApplicationController
  def create
    sound_attrs = params[:upload].delete(:sound)

    Upload.create_for(viewer, params[:upload], sound_attrs)

    redirect_to :back
  end
end
