class User < Sequel::Model
  def self.find_or_create_from_soundcloud_auth(auth_hash)
    unless auth_hash['provider'] == 'soundcloud'
      raise ArgumentError, 'Not a Soundcloud auth hash'
    end

    begin
      provider_id = auth_hash.fetch('uid').to_i
      username    = auth_hash.fetch('info').fetch('nickname')

      find_or_create(provider_id: provider_id) do |u|
        u.username = username
      end
    rescue KeyError => e
      raise ArgumentError, "Invalid auth hash: #{e.message}"
    end
  end
end
