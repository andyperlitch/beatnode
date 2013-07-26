class SoundPresenter < Presenter
  def json
    super.merge(uploader: uploader_id)
  end

  private

  def uploader_id
    object.uploader.try(:id)
  end
end
