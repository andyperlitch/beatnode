require 'sqlite3'
require 'sequel'

DB = Sequel.sqlite

DB.create_table :users do
  primary_key :id

  String :provider_id,   null: false
  String :provider_name, null: false
  String :username,      null: false

  index [:provider_id, :provider_name]
end

DB.create_table :nodes do
  primary_key :id

  foreign_key :uploader_id, :users, index: true, null: false

  String :title, null: false
end

DB.create_table :samplings do
  foreign_key :source_id, :nodes, index: true, null: false
  foreign_key :result_id, :nodes, index: true, null: false

  index [:source_id, :result_id], unique: true
end
