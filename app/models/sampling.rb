class Sampling < Sequel::Model
  many_to_one :source, class: :Node
  many_to_one :result, class: :Node

  def self.create_between(source, result)
    create(source: source, result: result)
  end
end
