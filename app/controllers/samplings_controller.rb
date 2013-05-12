class SamplingsController < ApplicationController
  def create
    result = Sound[params[:sampling][:result_id]]

    if result.uploader == viewer
      source = Sound[params[:sampling][:source_id]]
      Sampling.create_between(source, result)
      redirect_to :back
    else
      head 403
    end
  end
end
