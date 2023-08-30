class Review < ApplicationRecord
  belongs_to :shop, optional: true
  mount_uploader :image, ImageUploader
  validates :rate, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
  validates :comment, length: { maximum: 140 }
  validates :exist_counter_sheets?, inclusion: { in: [true, false] }, allow_blank: true
  validates :frequent_solo_visitors, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5, allow_blank: true }
  validates :exist_solo_tables?, inclusion: { in: [true, false] }, allow_blank: true
  validates :easy_to_order, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5, allow_blank: true }
  validates :delivery_speed, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5, allow_blank: true }
  validates :calmness, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5, allow_blank: true }
end
