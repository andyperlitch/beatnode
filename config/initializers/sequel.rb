class Sequel::Model
  alias_method :save!, :save # for compatibility with factory_girl

  plugin :validation_helpers
end
