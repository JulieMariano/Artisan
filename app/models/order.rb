class Order < ApplicationRecord
  validates :state, presence: true

  belongs_to :user

  has_many :orders_items
  has_many :items, through: :orders_items

  def subtotal
    orders_items.inject(0) { |sum, order_item| sum += order_item.subtotal }
  end
end
