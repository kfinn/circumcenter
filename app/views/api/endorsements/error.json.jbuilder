json.endorsement do
  json.partial! @endorsement
end
json.errors(@endorsement.errors.details)
