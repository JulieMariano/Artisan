class Order < ApplicationRecord
  validates :state, presence: true
  validates :items, presence: true

  serialize :items    # To transform the text column in type hash

  belongs_to :user
end
