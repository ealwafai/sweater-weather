class LocationService
  class << self
    def conn
      Faraday.new("http://www.mapquestapi.com/geocoding/v1/") do |f|
        f.params['key'] = ENV['mapquest_key']
      end
    end

    def get_lat_long(city_state)
      response = conn.get("address?location=#{city_state}")
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
