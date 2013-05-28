Sequel.migration do
  change do
    create_table :collaborations do
      foreign_key :source_id,  :users, null: false
      foreign_key :subject_id, :users, null: false

      index [:source_id, :subject_id], unique: true
    end
  end
end
