class Order < ApplicationRecord
  validates :state, presence: true

  belongs_to :user

  has_many :orders_items
  has_many :items, through: :orders_items

  # Returns the number of items of the order
  def num_items
    orders_items.inject(0) { |sum, order_item| sum += order_item.quantity }
  end

  # Returns the cost of the items of the order
  def subtotal
    orders_items.inject(0) { |sum, order_item| sum += order_item.subtotal }
  end

  # Returns the shipping cost of the order
  def shipping
    items_subtotal = subtotal.to_i

    if items_subtotal < 100
      result = [3.5, items_subtotal * 0.05].max

    elsif items_subtotal < 500
      result =  [5.5, items_subtotal * 0.03].max

    else
      result = [16, items_subtotal * 0.02].max
    end

    return Money.new(result * 100)
  end

  # Returns the total cost of the order
  def total
    subtotal + shipping
  end
end
