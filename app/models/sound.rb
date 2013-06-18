class Sound < Sequel::Model
  many_to_one :uploader, class: :User

  def_dataset_method :recent do
    order(:created_at.desc)
  end

  def validate
    super
    validates_presence :title
  end
end
