module Auth
  def self.from_hash(auth_object={})
    case auth_object[:provider] || auth_object['provider']
    when 'soundcloud'
      Soundcloud.new(auth_object)
    when 'developer'
      Developer.new(auth_object)
    else
      raise "Can't extract provider from hash: #{auth_object.inspect}"
    end
  end

  class Base < Struct.new(:auth_object)
    def initialize(object)
      super(object.with_indifferent_access)
    end

    def provider
      auth_object.fetch(:provider)
    end
  end

  class Developer < Base
    def provider_id
      auth_object.fetch(:uid).to_s
    end

    def username
      auth_object.fetch(:info).with_indifferent_access.fetch(:name)
    end
  end

  class Soundcloud < Base
    def provider_id
      auth_object.fetch(:uid).to_s
    end

    def username
      auth_object.fetch(:info).with_indifferent_access.fetch(:nickname)
    end
  end
end
