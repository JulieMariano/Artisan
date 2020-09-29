class Order < ApplicationRecord
  validates :state, presence: true

  belongs_to :user

  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  monetize :shipping_costs_cents

  # Method that returns the number of Items of the Order
  def num_items
    order_items.inject(0) { |sum, order_item| sum += order_item.quantity }
  end

  # Method that returns the number of Items of the Order in string format
  def num_items_string
    "#{num_items} #{num_items == 1 ? "item" : "items"}"
  end

  # Method that returns the total cost of the Order Items
  def items_subtotal
    order_items.inject(0) { |sum, order_item| sum += order_item.subtotal }
  end

  # Method that returns the total cost of the Order
  def total
    items_subtotal + shipping_costs
  end

  # Method that returns the Order's Item where it was spent more money
  def leading_item
    order_items.max_by(&:subtotal).item
  end

  # Method that calculates and returns the shipping costs of the Order in Money format
  def calculate_shipping_costs
    subtotal = items_subtotal.to_i

    if subtotal < 100
      result = [3.5, subtotal * 0.05].max
    elsif subtotal < 500
      result =  [5.5, subtotal * 0.03].max
    else
      result = 15
    end

    return Money.new(result * 100)
  end
end
