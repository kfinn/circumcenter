json.call(recommendation, :id)
json.venue do
  json.call(recommendation.venue, :name)
end
