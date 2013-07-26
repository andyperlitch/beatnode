class SessionsController < ApplicationController
  skip_before_filter :require_signed_in, only: [:new, :create]

  def new
  end

  def create
    user = User.find_or_create_from_auth(auth)
    sign_in!(user)
    head 201
  end

  def destroy
    sign_out!
    head 204
  end

  private

  def auth
    Auth.from_hash(request.env['omniauth.auth'])
  end

  def referrer
    request.env['HTTP_REFERER']
  end
end
