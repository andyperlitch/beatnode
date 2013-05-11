class Node < Sequel::Model
  many_to_one :uploader, class: :User

  many_to_many :sources, class: :Node,
    left_key:   :result_id,
    right_key:  :source_id,
    join_table: :samplings

  many_to_many :usages, class: :Node,
    left_key:   :source_id,
    right_key:  :result_id,
    join_table: :samplings

  def_dataset_method :recent do
    order(:created_at.desc)
  end

  def validate
    super
    validates_presence :title
  end

  def in_user_crate?(user)
    !user.crate_dataset.where(node_id: self.id).empty?
  end
end
