class NodesController < ApplicationController
  def new
    @node = Node.new(uploader: viewer)
  end

  def create
    @node = Node.new(params[:node])

    if @node.valid?
      @node.save
      flash[:success] = 'Success!'
      redirect_to root_url
    else
      render :new
    end
  end
end
