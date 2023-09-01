class Shop < ApplicationRecord
  has_many :reviews
  mount_uploader :image, ImageUploader
  validates :name, presence: true, length: { maximum: 60 }
  validates :address, presence: true, length: { maximum: 200 }
  validates :latitude, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :longitude, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  #後で変更する
  validates :genre, length: { maximum: 50 }

  scope :sort_by_highest_rate, -> { group(:review_id).count }

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end

  def self.sort_by_count_of_reviews
    Review.group(:shop_id).includes(:shop).select(:shop_id, 'count(*) as c').order(c: :desc).map{|review| review.shop}
  end
end
