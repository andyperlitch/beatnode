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

  def validate
    super
    validates_presence :title
  end
end
