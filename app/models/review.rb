class Review < ApplicationRecord
  validates :rating, presence: true
  validates :content, presence: true

  belongs_to :user
  belongs_to :item
end
