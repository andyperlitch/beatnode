class SoundsController < ApplicationController
  def new
    @sound = Sound.new(uploader: viewer)
  end

  def create
    @sound = viewer.build_sound(params[:sound])

    if @sound.valid?
      Sound.db.transaction do
        @sound.save
        viewer.crate.add(@sound)
      end

      flash[:success] = 'Success!'
      redirect_to uploads_path
    else
      render :new
    end
  end

  def show
    @sound = Sound[params[:id]]
  end
end
