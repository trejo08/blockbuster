class Movie < Sequel::Model
  require 'mime/types'

  def validate
    super
    errors.add(:name, "must be present") if name.empty?
  end
end