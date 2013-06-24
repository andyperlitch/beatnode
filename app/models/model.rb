Model = Sequel::Model

class Model
  def validates_associated(relation)
    assoc = send(relation)

    unless assoc.valid?
      assoc.errors.full_messages.each do |msg|
        errors.add(relation, msg)
      end
    end
  end
end
