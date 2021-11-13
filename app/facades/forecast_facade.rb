class ForecastFacade
  def self.weather_forecast
    forecast = ForecastService.get_forecast(lat, lon)
    Forecast.new(forecast)
  end
end
