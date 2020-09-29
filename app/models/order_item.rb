class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  # Method that returns the OrderItem total cost
  def subtotal
    item.price * quantity
  end
end
