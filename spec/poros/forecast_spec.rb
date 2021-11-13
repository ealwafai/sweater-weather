require 'rails_helper'

RSpec.describe Forecast do
  it 'can initialize from weather params' do
    current_forecast_params = {
      dt: 1_632_891_978,
      sunrise: 1_632_833_607,
      sunset: 1_632_876_443,
      temp: 60.13,
      feels_like: 58.06,
      pressure: 1009,
      humidity: 47,
      dew_point: 39.87,
      uvi: 0,
      clouds: 82,
      visibility: 10_000,
      wind_speed: 5.57,
      wind_deg: 255,
      wind_gust: 8.12,
      weather: [{ id: 803, main: 'Clouds', description: 'broken clouds', icon: '04n' }]
    }

    current = CurrentForecast.new(current_forecast_params)

    hourly_forecast_params = {
      dt: 1_632_888_000,
      temp: 61.56,
      feels_like: 59.52,
      pressure: 1003,
      humidity: 45,
      dew_point: 40.05,
      uvi: 0,
      clouds: 81,
      visibility: 10_000,
      wind_speed: 6.64,
      wind_deg: 212,
      wind_gust: 8.16,
      weather: [{ id: 803, main: 'Clouds', description: 'broken clouds', icon: '04n' }],
      pop: 0.47
    }

    hourly = HourlyForecast.new(hourly_forecast_params)

    daily_forecast_params = {
      dt: 1_632_852_000,
      sunrise: 1_632_833_607,
      sunset: 1_632_876_443,
      moonrise: 1_632_893_220,
      moonset: 1_632_860_280,
      moon_phase: 0.75,
      temp: { day: 78.84, min: 60.19, max: 81, night: 60.19, eve: 77.41, morn: 69.21 },
      feels_like: { day: 78.84, night: 58.15, eve: 75.85, morn: 67.1 },
      pressure: 1002,
      humidity: 18,
      dew_point: 31.78,
      wind_speed: 17.36,
      wind_deg: 137,
      wind_gust: 23.64,
      weather: [{ id: 500, main: 'Rain', description: 'light rain', icon: '10d' }],
      clouds: 52,
      pop: 0.59,
      rain: 0.13,
      uvi: 5.75
    }

    daily = DailyForecast.new(daily_forecast_params)

    forecast = Forecast.new(current, daily, hourly)

    expect(forecast).to be_a(Forecast)
    expect(forecast.current).to be_a(CurrentForecast)
    expect(forecast.daily).to be_a(DailyForecast)
    expect(forecast.hourly).to be_a(HourlyForecast)
  end
end
