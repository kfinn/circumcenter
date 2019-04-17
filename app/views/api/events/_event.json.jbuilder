json.call(@event, :id, :start)
json.venues @event.venues do |venue|
  json.call(venue, :id, :name)
  json.recommendations(venue.recommendations.where(event: @event).size)
end
