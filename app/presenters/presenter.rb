require 'delegate'

class Presenter < SimpleDelegator
  def object
    __getobj__
  end

  def json
    object.values
  end
end
