class Collaboration < Sequel::Model
  many_to_one :source,  class: :User
  many_to_one :subject, class: :User

  def self.create_between(source, subject)
    create(source: source, subject: subject)
  end

  def validate
    super
    validate_source_isnt_subject
  end

  private

  def validate_source_isnt_subject
    if source == subject
      errors.add(:subject, "can't be the same as source")
    end
  end
end
