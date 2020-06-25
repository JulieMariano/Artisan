class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true

  belongs_to :category
  has_many :orders
  has_many :reviews

  has_one_attached :picture
end
