class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :items

  def top_three_items
    items[0..2]
  end
end
