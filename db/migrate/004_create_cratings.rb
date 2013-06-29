Sequel.migration do
  change do
    create_table :cratings do
      primary_key :id

      foreign_key :owner_id, :users, null: false
      foreign_key :sound_id,  :sounds, null: false

      index [:owner_id, :sound_id], unique: true
    end
  end
end
