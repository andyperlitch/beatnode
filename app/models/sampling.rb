class Sampling < Sequel::Model
  many_to_one :source, class: :Node
  many_to_one :result, class: :Node
end
