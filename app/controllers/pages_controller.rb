class PagesController < ApplicationController
  def home
  end

  def crate
    @crate = viewer.crate
  end

  def uploads
    @uploaded_nodes = viewer.recent_uploads
  end
end
