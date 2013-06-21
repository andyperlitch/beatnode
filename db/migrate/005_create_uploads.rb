Sequel.migration do
  change do
    create_table :uploads do
      primary_key :id

      foreign_key :sound_id, :sounds, index: true, null: false
      foreign_key :user_id,  :users,  index: true, null: false

      String   :location,   null: false
      DateTime :created_at, null: false
      DateTime :updated_at
    end
  end
end
