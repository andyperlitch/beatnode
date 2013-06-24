class Crating < Model
  many_to_one :owner, class: :User
  many_to_one :sound

  class << self
    def create_between(user, sound)
      create(owner: user, sound: sound)
    end

    def between(user, sound)
      find(owner: user, sound: sound)
    end
  end
end
