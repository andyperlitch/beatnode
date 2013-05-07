module SessionsHelper
  def sign_in!(user)
    session[:user_id] = user.id
  end

  def sign_out!
    session[:user_id] = nil
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
