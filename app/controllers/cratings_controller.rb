class CratingsController < ApplicationController
  def create
    sound = Sound[params[:crating][:sound_id]]
    crating = viewer.crate.add(sound)
    render json: json(crating), status: 201
  end
end
