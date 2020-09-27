class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }

  has_many :orders
  has_many :reviews

  # Method that returns the User paid Orders list
  # Orders with the 'delivered' state where already paid for
  def paid_orders
    orders.where(state: ['paid', 'delivered']).order(updated_at: :asc)
  end

  # Method that returns the shopping cart Order of the User
  # Only one Order with the 'pending' state is possible per User
  def cart
    orders.find_by(state: 'pending')
  end

  # Method that returns the number of Items a User has in it's shopping cart
  def cart_size
    cart.nil? ? 0 : cart.num_items
  end
end
