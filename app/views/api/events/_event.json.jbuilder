json.call(@event, :id, :start)
json.venue_suggestions @event.venue_suggestions.includes(:endorsements) do |venue_suggestion|
  json.call(venue_suggestion, :id, :name)
  json.endorsements(venue_suggestion.endorsements.size)
end
