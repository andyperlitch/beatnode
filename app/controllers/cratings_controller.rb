class CratingsController < ApplicationController
  def create
    sound = Sound[params[:crating][:sound_id]]
    viewer.crate.add(sound)
    redirect_to :back
  end
end
