json.event do
  json.partial! @event
end
json.errors(@event.errors.details)
