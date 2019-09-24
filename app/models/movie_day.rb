class MovieDay < Sequel::Model
  plugin :enum
  enum :day, [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]
end