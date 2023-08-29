class Review < ApplicationRecord
  belongs_to :shop
  
  validates :rate, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :comment, length: { maximum: 140 }
  validates :exist_counter_sheets?, inclusion: { in: [true, false] }
  validates :frequent_solo_visitors, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :exist_solo_tables?, inclusion: { in: [true, false] }
  validates :easy_to_order, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :delivery_speed, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :calmness, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
