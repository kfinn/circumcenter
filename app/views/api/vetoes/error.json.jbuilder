json.veto do
  json.partial! @veto
end
json.errors(@veto.errors.details)
