class Crating < Sequel::Model
  many_to_one :owner, class: :User
  many_to_one :sound

  def self.create_between(user, sound)
    create(owner: user, sound: sound)
  end
end
