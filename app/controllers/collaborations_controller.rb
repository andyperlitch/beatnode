class CollaborationsController < ApplicationController
  def create
    subject = User[params[:collaboration][:subject_id]]
    collab  = Collaboration.create_between(viewer, subject)

    render json: json(collab), status: 201
  end
end
