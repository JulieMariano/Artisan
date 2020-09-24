class Order < ApplicationRecord
  validates :state, presence: true

  belongs_to :user

  has_many :orders_items, dependent: :destroy
  has_many :items, through: :orders_items

  monetize :shipping_costs_cents

  # Returns the number of items of the order
  def num_items
    orders_items.inject(0) { |sum, order_item| sum += order_item.quantity }
  end

  # Returns the number of items of an order in a string format
  def num_items_string
    "#{num_items} #{num_items == 1 ? "item" : "items"}"
  end

  # Returns the cost of the items of the order
  def items_subtotal
    orders_items.inject(0) { |sum, order_item| sum += order_item.subtotal }
  end

  # Returns the total cost of the order
  def total
    items_subtotal + shipping_costs
  end

  # Returns the Order's Item where it was spent more money
  def leading_item
    orders_items.max_by(&:subtotal).item
  end

  # Returns the calculated shipping costs of the order
  def calculate_shipping_costs
    subtotal = items_subtotal.to_i

    if subtotal < 100
      result = [3.5, subtotal * 0.05].max
    elsif subtotal < 500
      result =  [5.5, subtotal * 0.03].max
    else
      result = [16, subtotal * 0.02].max
    end

    return Money.new(result * 100)
  end

  # Returns the calculated total cost of the order
  def calculate_total
    items_subtotal + calculate_shipping_costs
  end

  # Returns the expected delivery date (3 days after payment)
  # Payment is the last update that a order can take and only after it is the order delivered
  def calculate_delivery_date
    order.updated_at + (60*60*24*3)
  end
end
