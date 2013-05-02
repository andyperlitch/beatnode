class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_or_create_from_auth(auth_hash)
    sign_in!(user)
    head 200
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
