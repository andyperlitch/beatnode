class UsersController < ApplicationController
  def show
    user = User[params[:id]]
    render json: json(user)
  end
end
