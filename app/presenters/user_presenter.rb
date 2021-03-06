class UserPresenter < Presenter
  def json
    super.merge(uploaded_sound_ids: uploaded_sound_ids,
                crated_sound_ids:   crated_sound_ids)
  end

  private

  def uploaded_sound_ids
    uploaded_sounds.map(&:id)
  end

  def crated_sound_ids
    crate.map(&:id)
  end
end
