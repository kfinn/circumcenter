class Recommendation < ApplicationRecord
  belongs_to :event
  belongs_to :venue

  after_create :broadcast_to_event

  def broadcast_to_event
    EventVenueRecommendationsChannel.broadcast_to(event, {})
  end
end
