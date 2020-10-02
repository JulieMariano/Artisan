class Review < ApplicationRecord
  validates :content, presence: true
  validates :rating, presence: true,
                     inclusion: 0..5,
                     numericality: { only_integer: true }

  belongs_to :item
  belongs_to :user
end
