json.event_venue_recommendation do
  json.partial! @event_venue_recommendation
end
json.errors(@event_venue_recommendation.errors.details)
