class Review < ApplicationRecord
  validates :rating, presence: true, inclusion: 0..5, numericality: { only_integer: true }
  validates :content, presence: true

  belongs_to :user
  belongs_to :item

  def time_ago_in_words(from_time)
    distance_of_time_in_words(from_time, Time.now)
  end
end
