class Reservation < Sequel::Model
  require 'mime/types'
  many_to_one :customer

  def validate
    super
    errors.add(:name, "must be present") if name.empty?
  end
end