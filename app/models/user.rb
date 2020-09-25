class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }

  has_many :orders
  has_many :reviews

  def paid_orders
    orders.where(state: 'paid').order(updated_at: :asc)
  end

  # Only one pending Order is possible per User
  def cart
    orders.find_by(state: 'pending')
  end

  def cart_size
    cart.nil? ? 0 : cart.num_items
  end
end
