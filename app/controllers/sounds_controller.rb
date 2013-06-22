class SoundsController < ApplicationController
  def show
    @sound = Sound[params[:id]]
  end
end
