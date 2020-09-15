json.current_participant do
  json.partial! @current_participant
end
json.errors(@current_participant.errors.details)
