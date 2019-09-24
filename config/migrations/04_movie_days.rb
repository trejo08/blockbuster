Sequel.migration do
  up do
    create_table(:movie_days) do
      primary_key :id
      Integer :day, null: false
      foreign_key :movie_id, :movies
    end
  end

  down do
    drop_table(:movie_days)
  end
end