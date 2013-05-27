class Sound < Sequel::Model
  many_to_one :uploader, class: :User

  many_to_many :sources, class: :Sound,
    left_key:   :result_id,
    right_key:  :source_id,
    join_table: :samplings

  many_to_many :usages, class: :Sound,
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
end