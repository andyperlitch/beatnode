class SessionsController < ApplicationController
  skip_before_filter :require_signed_in, only: [:new, :create]

  def new
  end

  def create
    user = User.find_or_create_from_auth(auth_hash)
    sign_in!(user)

    redirect_to referrer || root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def referrer
    request.env['HTTP_REFERER']
  end
end
