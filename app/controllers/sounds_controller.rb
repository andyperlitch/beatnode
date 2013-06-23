class SoundsController < ApplicationController
  def show
    unless @sound = Sound[params[:id]]
      head 404
    end
  end
end
