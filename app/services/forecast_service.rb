class ForecastService
  class << self
    def conn
      Faraday.new("https://api.openweathermap.org") do |f|
        f.params['appid'] = ENV['forecast_key']
      end
    end

    def get_forecast(lat, lon)
      response = conn.get("/data/2.5/onecall") do |req|
        req.params['lat'] = lat
        req.params['lon'] = lon
        req.params['units'] = 'imperial'
        req.params['exclude'] = 'minutely'
      end
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
