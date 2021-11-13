class LocationFacade
  def self.get_lat_long(city_state)
    json = LocationService.get_lat_long(city_state)
    result = json[:results].first[:locations].first[:latLng]
    Location.new(result)
  end
end
