class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :items

  def ordered_by_relevante_array
    items.sort_by { |item| - item.relevance_points }
  end
end
