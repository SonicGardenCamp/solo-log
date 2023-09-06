class Shop < ApplicationRecord
  has_many :reviews
  mount_uploader :image, ImageUploader
  validates :name, presence: true, length: { maximum: 60 }
  validates :address, presence: true, length: { maximum: 200 }
  validates :latitude, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  #後で変更する
  validates :genre, length: { maximum: 50 }

  scope :sort_by_highest_rate, -> { group(:review_id).count }

  def average_rating
    # Review.where(shop_id: shop.id).group(:shop_id).select(:shop_id, 'avg(*) as avg')
    reviews.average(:rate)
  end

  def self.sort_by_count_of_reviews(shops)
    Review.where(shop_id: shops.ids).group(:shop_id).includes(:shop).select(:shop_id, 'count(*) as c').order(c: :desc).map{|review| review.shop}
  end

  def self.sort_by_average_rating(shops)
    Review.where(shop_id: shops.ids).group(:shop_id).includes(:shop).select(:shop_id, 'avg(rate) as avg').order(avg: :desc).map{|review| review.shop}
  end

  def update_lat_and_long
    if image? && exif_data_exists_in_image?
      lat_deg  = to_deg(Magick::ImageList.new('public'+image.url).get_exif_by_entry('GPSLatitude')[0][1].split(','))
      long_deg = to_deg(Magick::ImageList.new('public'+image.url).get_exif_by_entry('GPSLongitude')[0][1].split(','))
      update_columns(latitude: lat_deg, longitude: long_deg)
    end
  end

  def exif_data_exists_in_image?
    Magick::ImageList.new('public'+image.url).get_exif_by_entry('GPSLatitude')[0][1].present?
  end

  def to_deg(dms)
    (Rational(dms[0]) + Rational(dms[1])/60 + Rational(dms[2])/3600).to_f
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end