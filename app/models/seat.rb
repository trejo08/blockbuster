class Seat < Sequel::Model
  one_to_many :reservations

  def validate
    super
    errors.add(:name, "must be present") if name.empty?
  end
end