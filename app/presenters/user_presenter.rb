class UserPresenter < Presenter
  def json
    super.merge(uploaded_sounds: uploaded_sound_ids)
  end

  private

  def uploaded_sound_ids
    uploaded_sounds.map(&:id)
  end
end
