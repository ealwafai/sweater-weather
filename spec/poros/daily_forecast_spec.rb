require 'rails_helper'

RSpec.describe DailyForecast do
  it 'can initialize from daily forecast params' do
    daily_forecast_params = {
      dt: 1_636_826_400,
      sunrise: 1_636_810_962,
      sunset: 1_636_847_163,
      moonrise: 1_636_838_880,
      moonset: 1_636_790_160,
      moon_phase: 0.33,
      temp: { day: 63.54, min: 46.99, max: 64.69, night: 50.95, eve: 58.62, morn: 48.06 },
      feels_like: { day: 60.76, night: 47.35, eve: 55.31, morn: 45.57 },
      pressure: 1016,
      humidity: 25,
      dew_point: 27.68,
      wind_speed: 8.05,
      wind_deg: 296,
      wind_gust: 26.37,
      weather: [{ id: 804, main: 'Clouds', description: 'overcast clouds', icon: '04d' }],
      clouds: 100,
      pop: 0,
      uvi: 2.39
    }

    daily = DailyForecast.new(daily_forecast_params)

    expect(daily).to be_a(DailyForecast)
    expect(daily.date).to eq('2021-11-13 18:00:00 UTC')
    expect(daily.sunrise).to eq('2021-11-13 13:42:42 UTC')
    expect(daily.sunset).to eq('2021-11-13 23:46:03 UTC')
    expect(daily.max_temp).to eq(64.69)
    expect(daily.min_temp).to eq(46.99)
    expect(daily.conditions).to eq('overcast clouds')
    expect(daily.icon).to eq('04d')
  end
end
