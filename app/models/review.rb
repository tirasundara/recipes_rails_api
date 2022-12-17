class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :rating, numericality: { in: 1..5, only_integer: true }
end
