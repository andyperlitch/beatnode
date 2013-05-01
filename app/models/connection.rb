class Connection < Sequel::Model
  many_to_one :parent, class: Node
  many_to_one :child,  class: Node
end
