class User < Sequel::Model
  def self.find_or_create_from_auth(auth_hash)
    auth = Auth.new(auth_hash)
    prov, id = auth.provider, auth.provider_id

    find_or_create(provider: prov, provider_id: id) do |u|
      u.username = auth.username
    end
  end
end
