class MovieDay < Sequel::Model
  many_to_one :movie
  one_to_many :reservations
  plugin :enum
  DAYS = { monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5, saturday: 6, sunday: 7 }
  # enum :day, [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]
  enum :day, DAYS
end