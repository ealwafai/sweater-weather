require 'rails_helper'

RSpec.describe ForecastService do
  describe 'class methods' do
    describe '.conn' do
      it 'establishes connection to the open weather map api' do
        connection = ForecastService.conn

        expect(connection.params).to include('appid')
      end
    end

    describe '.get_forecast', :vcr do
      it 'returns weather for a specific location based on lat and long' do
        location = LocationFacade.get_lat_long('denver,co')
        response = ForecastService.get_forecast(location)

        expect(response).to be_a(Hash)
        expect(response.keys).to eq([:lat, :lon, :timezone, :timezone_offset, :current, :hourly, :daily])
        expect(response.keys).to_not include([:minutely])
      end
    end
  end
end
