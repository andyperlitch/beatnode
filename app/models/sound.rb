class Sound < Sequel::Model
  def uploader
    User.select(:users.*).
      join(:uploads, user_id: :id).
      where(sound_id: self.id).first
  end

  def validate
    super
    validates_presence :title
  end
end
