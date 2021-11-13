require 'rails_helper'

RSpec.describe LocationFacade do
  describe 'class methods' do
    describe '.get_lat_long' do
      it 'returns latitude and longitude of a specific location', :vcr do
        result = LocationFacade.get_lat_long('Denver, CO')

        expect(result).to be_a(Location)
        expect(result.latitude).to eq(39.738453)
        expect(result.longitude).to eq(-104.984853)
      end
    end
  end
end
