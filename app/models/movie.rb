class Movie < Sequel::Model
  require 'mime/types'

  def validate
    super
    errors.add(:name, "must be present") if name.empty?
    errors.add(:image_url, "must be image") if image_url.present? && validate_image
  end

  def validate_image
    is_image = false
    image_type = MIME::Types.type_for(image_url).first.content_type
    ['image/jpeg', 'image/jpg', 'image/png'].each do |type|
      next unless image_type == type
      is_image = true
    end
    is_image
  end
end