class UnableToPresent < ArgumentError; end

module PresentersHelper
  def json(object)
    present(object).json
  end

  def present(object)
    begin
      pclass = "#{object.class}Presenter".constantize
    rescue NameError => e
      raise UnableToPresent, e.message
    end

    pclass.new(object)
  end
end
