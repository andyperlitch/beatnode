module SessionsHelper
  def sign_in!(user)
    session[:user_id] = user.user_id
  end

  def signed_in?
    !!viewer
  end

  def viewer
    User[session[:user_id]]
  end

  def require_signed_in
    redirect_to(sign_in_path) unless signed_in?
  end
end
