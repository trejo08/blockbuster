Sequel.migration do
  up do
    create_table(:reservations) do
      primary_key :id
      Date :date, null: false
      foreign_key :customer_id, :customers
      foreign_key :movie_day_id, :movie_days
      foreign_key :seat_id, :seats
    end
  end

  down do
    drop_table(:artists)
  end
end