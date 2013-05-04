class PagesController < ApplicationController
  def home
    @uploaded_nodes = viewer.uploaded_nodes
  end
end
