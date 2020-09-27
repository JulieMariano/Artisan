class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :items

  # Method that returns the Category items sorted by relevance
  def items_by_relevance
    items.sort_by { |item| - item.relevance_points }
  end
end
