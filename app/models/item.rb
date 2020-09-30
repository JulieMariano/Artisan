class Item < ApplicationRecord
  validates :description, length: { maximum: 120 }
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false },
                   length: { minimum: 2, maximum: 20 }
  validates :price, presence: true,
                    numericality: { greater_than: 0, less_than: 10000 }
  validates :sku, presence: true

  belongs_to :category
  has_many :reviews

  has_one_attached :picture
  validate :picture?

  monetize :price_cents

  # Method that returns the Item's average review rating
  def rating_average
    reviews.reduce(0) { |sum, review| sum + review.rating }
           .fdiv(reviews.size)
  end

  # Method that returns the Item's relevance points
  # This metric has a positive correlation with both the average rating and the number of reviews
  # While the first variable manifests a perfect correlation, the second shows a decreasing one
  def relevance_points
    num_reviews = reviews.size
    rating_average.nan? ? 0 : (num_reviews * rating_average) / (num_reviews ** 0.8)
  end

  private

  # Method that adds a 'presence: true' validation to the picture
  def picture?
    errors.add(:picture, 'has to be present') unless picture.attached?
  end
end
