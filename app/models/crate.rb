class Crate < Struct.new(:user)
  include Enumerable

  def each
    dataset.all.each do |member|
      yield member
    end
  end

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

  def without(*sounds)
    ids = sounds.map(&:id)
    dataset.exclude(sound_id: ids)
  end

  private

  def dataset
    Sound.select(:sounds.*).
      join(:cratings, sound_id: :id).
      where(owner_id: user.id)
  end

  class DuplicateEntry < ArgumentError; end
end
