class Node < Sequel::Model
  many_to_one :uploader, class: :User

  many_to_many :parents, class: :Node,
    left_key:   :child_id,
    right_key:  :parent_id,
    join_table: :connections

  many_to_many :children, class: :Node,
    left_key:   :parent_id,
    right_key:  :child_id,
    join_table: :connections

  def validate
    super
    validates_presence :title
  end
end
