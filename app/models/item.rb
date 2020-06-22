class Item < ApplicationRecord
  belongs_to :category
  has_many :orders
  validates :name, presence: true
  validates :price, presence: true
end
