class Crating < Sequel::Model
  many_to_one :owner, class: :User
  many_to_one :node

  def self.create_between(user, node)
    create(owner: user, node: node)
  end
end
