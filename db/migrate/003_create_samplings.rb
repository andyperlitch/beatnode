Sequel.migration do
  create_table :samplings do
    foreign_key :source_id, :sounds, null: false
    foreign_key :result_id, :sounds, null: false

    index [:source_id, :result_id], unique: true
  end
end
