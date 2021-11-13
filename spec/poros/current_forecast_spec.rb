require 'rails_helper'

RSpec.describe CurrentForecast do
  it 'can initialize from current forecast params' do
    current_forecast_params = {
      dt: 1_636_828_826,
      sunrise: 1_636_810_962,
      sunset: 1_636_847_163,
      temp: 64.38,
      feels_like: 61.65,
      pressure: 1016,
      humidity: 24,
      dew_point: 27.45,
      uvi: 2.39,
      clouds: 100,
      visibility: 10_000,
      wind_speed: 1.99,
      wind_deg: 298,
      wind_gust: 4,
      weather: [{ id: 804, main: 'Clouds', description: 'overcast clouds', icon: '044' }]
    }

    current = CurrentForecast.new(current_forecast_params)

    expect(current).to be_a(CurrentForecast)
    expect(current.datetime).to eq('2021-11-13 18:40:26 UTC')
    expect(current.sunrise).to eq('2021-11-13 13:42:42 UTC')
    expect(current.sunset).to eq('2021-11-13 23:46:03 UTC')
    expect(current.temperature).to eq(64.38)
    expect(current.feels_like).to eq(61.65)
    expect(current.humidity).to eq(24)
    expect(current.uvi).to eq(2.39)
    expect(current.visibility).to eq(10_000)
    expect(current.conditions).to eq('overcast clouds')
    expect(current.icon).to eq('044')
  end
end
