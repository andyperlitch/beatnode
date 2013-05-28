Sequel.migration do
  create_table :sounds do
    primary_key :id

    foreign_key :uploader_id, :users, index: true, null: false

    String   :title,      null: false
    DateTime :created_at, null: false, index: true
    DateTime :updated_at
  end
end
