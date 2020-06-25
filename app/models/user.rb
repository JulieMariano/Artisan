class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, through: :orders
  has_many :orders
  has_many :reviews

  def payed_orders
    orders.where(bought: true).order(created_at: :desc)
  end

  def pending_orders
    orders.where(bought: false).order(created_at: :desc)
  end
end
