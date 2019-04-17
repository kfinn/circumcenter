json.call(recommendation, :id)
json.venue do
  json.call(recommendation.venue, :id, :name)
end
json.event do
  json.call(recommendation.event, :id, :start)
end
