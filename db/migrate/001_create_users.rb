Sequel.migration do
  change do
    create_table :users do
      primary_key :id

      String   :username,      null: false
      String   :provider_name, null: false
      Integer  :provider_id,   null: false
      DateTime :created_at,    null: false, index: true
      DateTime :updated_at

      index [:provider_id, :provider_name]
    end
  end
end
