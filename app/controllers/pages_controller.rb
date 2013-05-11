class PagesController < ApplicationController
  def home
    @uploaded_nodes = viewer.recent_uploads
  end

  def crate
    @crate = viewer.crate
  end
end
