class Sampling < Sequel::Model
  many_to_one :source, class: :Sound
  many_to_one :result, class: :Sound

  def self.create_between(source, result)
    create(source: source, result: result)
  end

  def validate
    super
    validate_source_isnt_result
  end

  private

  def validate_source_isnt_result
    if source == result
      errors.add(:result, "can't be the same as source")
    end
  end
end
