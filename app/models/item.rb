class Item < ApplicationRecord
  belongs_to :category
  has_many :orders
  has_one_attached :picture
  validates :name, presence: true
  validates :price, presence: true
end
