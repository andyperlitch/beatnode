require 'sqlite3'
require 'sequel'

DB = Sequel.sqlite

DB.create_table :users do
  primary_key :user_id

  Integer :provider_id, index: true

  String :username
end

DB.create_table :nodes do
  primary_key :node_id

  String  :name
end

DB.create_table :connections do
  primary_key :connection_id

  foreign_key :parent_id, :nodes, index: true
  foreign_key :child_id,  :nodes, index: true

  index [:parent_id, :child_id], unique: true
end
