Sequel.migration do
  up do
    create_table(:customers) do
      primary_key :id
      String :name, null: false
      String :lastname
      String :email
    end
  end

  down do
    drop_table(:customers)
  end
end