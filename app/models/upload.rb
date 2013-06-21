class Upload < Sequel::Model
  many_to_one :user
  many_to_one :sound

  def validate
    super
    validates_presence :location
  end
end
