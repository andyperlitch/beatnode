Sequel.migration do
  change do
    create_table :uploads do
      primary_key :id

      foreign_key :sound_id, :sounds, null: false
      foreign_key :user_id,  :users,  null: false

      String   :sha1,       null: false
      DateTime :created_at, null: false
      DateTime :updated_at

      index :user_id
      index :sound_id,             unique: true
      index [:sound_id, :user_id], unique: true
      index :sha1
    end
  end
end
