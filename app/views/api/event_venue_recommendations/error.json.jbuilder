json.recommendation do
  json.partial! @recommendation
end
json.errors(@recommendation.errors.details)
