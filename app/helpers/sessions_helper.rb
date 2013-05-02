module SessionsHelper
  def sign_in!(user)
    session[:user_id] = user.user_id
  end
end
