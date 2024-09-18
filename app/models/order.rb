# app/models/order.rb

class Order < ApplicationRecord
  belongs_to :customer

  validates :product_name, presence: true
  validates :product_count, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 100 }
  validates :customer, presence: true
end
