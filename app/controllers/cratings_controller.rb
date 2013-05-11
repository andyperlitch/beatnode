class CratingsController < ApplicationController
  def create
    node = Node[params[:crating][:node_id]]
    viewer.add_to_crate(node)
    redirect_to :back
  end
end
