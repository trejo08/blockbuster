Sequel.migration do
  up do
    create_table(:seats) do
      primary_key :id
      String :name
    end
  end

  down do
    drop_table(:seats)
  end
end