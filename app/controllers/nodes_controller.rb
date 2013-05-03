class NodesController < ApplicationController
  def new
    @node = Node.new(uploader: viewer)
  end
end
