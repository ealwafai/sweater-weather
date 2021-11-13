class LocationService
  class << self
    def conn
      Faraday.new("http://www.mapquestapi.com/geocoding/v1/") do |f|
        f.params['key'] = ENV['mapquest_key']
      end
    end

    def get_lat_long(location)
      response = conn.get("address?location=#{location}")
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
