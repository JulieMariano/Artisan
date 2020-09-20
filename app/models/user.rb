class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }

  has_many :items, through: :orders
  has_many :orders
  has_many :reviews

  def payed_orders
    orders.where(state: 'payed').order(created_at: :desc)
  end

  def pending_orders
    orders.where(state: 'pending').order(created_at: :desc)
  end
end
