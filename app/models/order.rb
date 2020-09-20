class Order < ApplicationRecord
  validates :state, presence: true

  belongs_to :item
  belongs_to :user
end
