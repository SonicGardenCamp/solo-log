class Review < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :shop
  mount_uploader :image, ImageUploader
  validates :rate, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
  validates :comment, length: { maximum: 140 }
  validates :counter_sheets_available, inclusion: { in: [true, false] }, allow_blank: true
  validates :frequent_solo_visitors, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5, allow_blank: true }
  validates :solo_tables_available, inclusion: { in: [true, false] }, allow_blank: true
  validates :easy_to_order, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5, allow_blank: true }
  validates :delivery_speed, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5, allow_blank: true }
  validates :calmness, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5, allow_blank: true }
  validates :latitude, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :longitude, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  def set_lat_and_long
    if image? && exif_data_exists_in_image?
      lat_deg  = to_deg(image.get_exif_by_entry('GPSLatitude')[0][1].split(','))
      long_deg = to_deg(image.get_exif_by_entry('GPSLongitude')[0][1].split(','))
      self.latitude, self.longitude = lat_deg, long_deg
    end
  end

  def exif_data_exists_in_image?
    image.get_exif_by_entry('GPSLatitude')[0][1].present?
  end

  def to_deg(dms)
    (Rational(dms[0]) + Rational(dms[1])/60 + Rational(dms[2])/3600).to_f
  end
end
