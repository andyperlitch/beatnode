SoundPresenter = Struct.new(:sound) do
  def json
    {
      id:       sound.id,
      title:    sound.title,
      uploader: uploader_id
    }
  end

  def uploader_id
    sound.uploader.try(:id)
  end
end
