Sequel.migration do
  change do
    create_table :sounds do
      primary_key :id

      String   :title,      null: false
      DateTime :created_at, null: false, index: true
      DateTime :updated_at
    end
  end
end
