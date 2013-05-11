class CratingsController < ApplicationController
  def create
    node = Node[params[:crating][:node_id]]
    viewer.crate.add(node)
    redirect_to :back
  end
end
