class CollaborationsController < ApplicationController
  def create
    subject = User[params[:collaboration][:subject_id]]
    Collaboration.create_between(viewer, subject)
    redirect_to :back
  end
end
