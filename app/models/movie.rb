class Movie < Sequel::Model
  one_to_many :movie_days
  plugin :nested_attributes
  nested_attributes :movie_days

  def validate
    super
    errors.add(:name, "must be present") if name.empty?
  end
end