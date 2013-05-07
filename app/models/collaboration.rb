class Collaboration < Sequel::Model
  many_to_one :source,  class: :User
  many_to_one :subject, class: :User
end
