class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  # Method that returns the OrderItem total cost
  def subtotal
    item.price * quantity
  end
end
