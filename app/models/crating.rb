class Crating < Sequel::Model
  many_to_one :owner, class: :User
  many_to_one :node
end
