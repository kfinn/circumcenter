class Venue < ApplicationRecord
  validates :name, presence: true

  has_many :recommendations, inverse_of: :venue
end
