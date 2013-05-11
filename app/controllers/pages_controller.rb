class PagesController < ApplicationController
  def home
    @uploaded_nodes = viewer.recent_uploads
  end
end
