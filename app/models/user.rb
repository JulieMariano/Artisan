class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }

  has_many :orders
  has_many :reviews

  def payed_orders
    orders.where(state: 'payed').order(created_at: :desc)
  end

  # Only one pending Order is possible by User
  def pending_order
    orders.find_by(state: 'pending')
  end
end
