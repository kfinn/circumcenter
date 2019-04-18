class Veto < ApplicationRecord
  belongs_to :venue_suggestion
  has_one :event, through: :venue_suggestion

  after_create :broadcast_to_event

  def broadcast_to_event
    EventVenueRecommendationsChannel.broadcast_to(event, {})
  end
end
