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

  def include?(node)
    !dataset.where(node_id: node.id).empty?
  end

  def count
    dataset.count
  end

  def add(node)
    Crating.create_between(user, node)
  end

  private

  def dataset
    Node.select(:nodes.*).
      join(:cratings, node_id: :id).
      where(owner_id: user.id)
  end

  class DuplicateEntry < ArgumentError; end
end
