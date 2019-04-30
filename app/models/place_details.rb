require 'open-uri'

class PlaceDetails
  include ActiveModel::Model

  attr_accessor :name, :location

  def self.find(id)
    uri = URI('https://maps.googleapis.com/maps/api/place/details/json')
    uri.query = {
      placeid: id,
      key: Rails.application.credentials.google_maps_api_key,
      fields: 'name,geometry'
    }.to_query
    open(uri.to_s) do |f|
      response = JSON.parse(f.read).with_indifferent_access
      if response[:status] == 'OK'
        from_json(response[:result])
      else
        nil
      end
    end
  end

  def self.from_json(json)
    new(
      name: json[:name],
      location: Location.new(json[:geometry][:location])
    )
  end

  class Location
    include ActiveModel::Model
    attr_accessor :latitude, :longitude
    alias lat= latitude=
    alias lng= longitude=
  end
end
