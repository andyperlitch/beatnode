class NodesController < ApplicationController
  def new
    @node = Node.new(uploader: viewer)
  end

  def create
    @node = viewer.build_node(params[:node])

    if @node.valid?
      DB.transaction do
        @node.save
        viewer.add_to_crate(@node)
      end

      flash[:success] = 'Success!'
      redirect_to uploads_path
    else
      render :new
    end
  end

  def show
    @node    = Node[params[:id]]
    @sources = @node.sources
    @crate   = viewer.crate
  end
end
