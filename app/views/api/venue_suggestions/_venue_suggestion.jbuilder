json.recommendation do
end
json.venue do
  json.call(@event_venue_recommendation.venue, :name, :id)
end
