class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }

  has_many :orders
  has_many :reviews

  def paid_orders
    orders.where(state: 'payed').order(updated_at: :desc)
  end

  # Only one pending Order is possible by User
  def pending_order
    orders.find_by(state: 'pending')
  end

  def pending_order_total
    pending_order.orders_items.inject(0) { |sum, order_item| sum += order_item.subtotal }
  end

  # Get the number of items in the 'pending' order
  def cart_size
    pending_order.orders_items.inject(0) { |sum, order_item| sum += order_item.quantity }
  end
end
