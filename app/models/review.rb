class Review < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :shop
  mount_uploader :image, ImageUploader
  validates :rate, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :comment, length: { maximum: 140 }
  validates :counter_sheets_available, inclusion: { in: [true, false] }, allow_blank: true
  validates :frequent_solo_visitors, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5, allow_blank: true }
  validates :solo_tables_available, inclusion: { in: [true, false] }, allow_blank: true
  validates :easy_to_order, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5, allow_blank: true }
  validates :delivery_speed, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5, allow_blank: true }
  validates :calmness, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5, allow_blank: true }
end