require 'sqlite3'
require 'sequel'

DB = Sequel.sqlite

DB.create_table :users do
  primary_key :id

  String   :username,      null: false
  String   :provider_name, null: false
  Integer  :provider_id,   null: false
  DateTime :created_at,    null: false, index: true
  DateTime :updated_at

  index [:provider_id, :provider_name]
end

DB.create_table :nodes do
  primary_key :id

  foreign_key :uploader_id, :users, index: true, null: false

  String   :title,      null: false
  DateTime :created_at, null: false, index: true
  DateTime :updated_at
end

DB.create_table :samplings do
  foreign_key :source_id, :nodes, index: true, null: false
  foreign_key :result_id, :nodes, index: true, null: false

  index [:source_id, :result_id], unique: true
end

DB.create_table :collaborations do
  foreign_key :source_id,  :users, index: true, null: false
  foreign_key :subject_id, :users, index: true, null: false

  index [:source_id, :subject_id], unique: true
end
