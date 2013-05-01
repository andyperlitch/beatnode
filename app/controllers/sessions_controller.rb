class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_soundcloud_auth(auth_hash)
    sign_in!(user)
    head 200
  end

  private

  def sign_in!(user)
    session[:user_id] = user.user_id
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end
