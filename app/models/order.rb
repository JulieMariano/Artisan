class Order < ApplicationRecord
  validates :state, presence: true

  belongs_to :user

  has_many :orders_items
  has_many :items, through: :orders_items
end
