class PagesController < ApplicationController
  def home
  end

  def crate
    @crate = viewer.crate
  end

  def uploads
    @uploaded_sounds = viewer.recent_uploads
  end
end
