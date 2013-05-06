class User < Sequel::Model
  one_to_many :uploaded_nodes, class: :Node, key: :uploader_id

  def self.find_or_create_from_auth(auth_hash)
    auth = Auth.from_hash(auth_hash)
    prov, id = auth.provider_name, auth.provider_id

    find_or_create(provider_name: prov, provider_id: id) do |u|
      u.username = auth.username
    end
  end

  def build_node(params={})
    Node.new(params).tap do |node|
      node.uploader = self
    end
  end
end
