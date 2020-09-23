class Order < ApplicationRecord
  validates :state, presence: true

  belongs_to :user

  has_many :orders_items
  has_many :items, through: :orders_items

  # Get the total to pay for the items in the order
  def subtotal
    orders_items.inject(0) { |sum, order_item| sum += order_item.subtotal }
  end

  # Get the number of items in the order
  def num_items
    orders_items.inject(0) { |sum, order_item| sum += order_item.quantity }
  end
end
