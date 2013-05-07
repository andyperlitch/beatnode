class Collaboration < Sequel::Model
  many_to_one :source,  class: :User
  many_to_one :subject, class: :User

  def self.create_between(source, subject)
    create(source: source, subject: subject)
  end
end
