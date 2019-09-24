class Reservation < Sequel::Model
  many_to_one :customer
  many_to_one :movie_day
  many_to_one :seat

  def validate
    super
    errors.add(:name, "must be present") if name.empty?
  end
end