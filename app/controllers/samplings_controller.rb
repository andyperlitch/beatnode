class SamplingsController < ApplicationController
  def create
    source = Node[params[:sampling][:source_id]]
    result = Node[params[:sampling][:result_id]]

    source.samples!(result)
    redirect_to :back
  end
end
