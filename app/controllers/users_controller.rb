class UsersController < ApplicationController
  def show
    if @user = User[params[:id]]
      @uploaded_nodes = @user.uploaded_nodes
    else
      head 404
    end
  end
end
