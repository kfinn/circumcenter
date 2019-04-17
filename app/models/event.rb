class Event < ApplicationRecord
  validates :start, presence: true

  has_many :recommendations, inverse_of: :event
  has_many :venues, -> { unique }, through: :recommendations
end
