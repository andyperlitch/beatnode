class UsersController < ApplicationController
  def show
    if @user = User[params[:id]]
      @uploaded_sounds = @user.recent_uploads
    else
      head 404
    end
  end
end
