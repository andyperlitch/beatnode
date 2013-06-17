Sequel.migration do
  change do
    create_table :samplings do
      primary_key :id

      foreign_key :source_id, :sounds, null: false
      foreign_key :result_id, :sounds, null: false

      index [:source_id, :result_id], unique: true
    end
  end
end
