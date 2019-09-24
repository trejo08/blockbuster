class MovieDay < Sequel::Model
  one_to_many :reservations
  plugin :enum
  enum :day, [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]
end