class Upload < Model
  many_to_one :user
  many_to_one :sound

  def validate
    super
    validates_presence :sha1
    validates_presence :content_type
    validates_unique   :sound_id
  end

  def file
    Beatnode.storage.fetch(sha1)
  end
end
