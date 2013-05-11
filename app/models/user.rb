class User < Sequel::Model
  one_to_many :uploaded_nodes, class: :Node, key: :uploader_id

  many_to_many :followers, class: :User,
    left_key:   :subject_id,
    right_key:  :source_id,
    join_table: :collaborations

  many_to_many :following, class: :User,
    left_key:   :source_id,
    right_key:  :subject_id,
    join_table: :collaborations

  many_to_many :crate, class: :Node,
    left_key:   :owner_id,
    right_key:  :node_id,
    join_table: :cratings

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

  def add_to_crate(node)
    Crating.create(owner: self, node: node)
  end

  def recent_uploads
    uploaded_nodes_dataset.recent
  end
end
