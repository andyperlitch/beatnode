class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # NOTE: not needed for omniauth authentication:
  #       https://github.com/intridea/omniauth/issues/237
  #protect_from_forgery with: :exception
end
