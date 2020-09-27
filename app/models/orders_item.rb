class OrdersItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  # Method that returns the OrdersItem total cost
  def subtotal
    item.price * quantity
  end
end
