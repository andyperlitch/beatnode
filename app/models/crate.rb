class Crate < Struct.new(:user)
  include Enumerable

  delegate :each, to: :dataset

  def empty?
    dataset.empty?
  end

  def include?(sound)
    !dataset.where(sound_id: sound.id).empty?
  end

  def count
    dataset.count
  end

  def add(sound)
    Crating.create_between(user, sound)
  end

  def remove(sound)
    Crating.between(user, sound).destroy
  end

  private

  def dataset
    Sound.select(:sounds.*).
      join(:cratings, sound_id: :id).
      where(owner_id: user.id)
  end
end
