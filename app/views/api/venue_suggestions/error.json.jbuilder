json.venue_suggestion do
  json.partial! @venue_suggestion
end
json.errors(@venue_suggestion.errors.details)
