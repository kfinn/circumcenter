class EventVenueRecommendation
  include ActiveModel::Model

  attr_accessor :event
  attr_writer :recommendation_attributes, :venue_attributes
  delegate :save, :valid?, :errors, to: :recommendation

  def recommendation
    @recommendation ||= event.recommendations.build({ venue: venue }.merge(recommendation_attributes))
  end

  def recommendation_attributes
    @recommendation_attributes || {}
  end

  def venue
    @venue ||= Venue.new(venue_attributes)
  end

  def venue_attributes
    @venue_attributes || {}
  end
end
