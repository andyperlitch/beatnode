class UsersController < ApplicationController
  def show
    user = User[params[:id]]
    render json: json(user)
  end

  private

  def json(user)
    UserPresenter.new(user).json
  end
end
