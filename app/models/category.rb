class Category < ApplicationRecord
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false },
                   length: { in: 2..25 }

  has_many :items, dependent: :destroy

  # Method that returns the Category items sorted by relevance
  def items_by_relevance
    items.sort_by { |item| - item.relevance_points }
  end
end
