class UsersController < ApplicationController
  def show
    if @user = User[params[:id]]
      @uploaded_sounds = @user.uploaded_sounds
    else
      head 404
    end
  end
end
