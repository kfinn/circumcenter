class Event < ApplicationRecord
  validates :start, presence: true

  has_many :recommendations, inverse_of: :event
  has_many :venues, -> { distinct }, through: :recommendations

  def build_venue_recommendation(params)
    EventVenueRecommendation.new({ event: self }.merge(params))
  end
end
