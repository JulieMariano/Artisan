class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true

  belongs_to :category
  has_many :orders
  has_many :reviews

  has_one_attached :picture

  monetize :price_cents

  def rating_average
    count = 0
    sum = 0
    reviews.each do |review|
      sum += review["rating"]
      count += 1
    end
    sum.to_f / count
  end

  def relevance_points
    if rating_average.nan?
      return 0
    else
      (reviews.size * rating_average) / ( reviews.size ** 0.68 )
    end
  end
end
