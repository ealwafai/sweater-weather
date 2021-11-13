require 'rails_helper'

RSpec.describe LatLongService do
  describe 'class methods' do
    describe '.conn' do
      it 'establishes connection to the mapquest geocoding api' do
        connection = LatLongService.conn

        expect(connection.params).to include('key')
      end
    end

    describe '.get_lat_long' do
      context 'happy path' do
        it 'returns forecast for a specific city', :vcr do
          response = LatLongService.get_lat_long('Denver, CO')

          expect(response).to be_a(Hash)
          expect(response).to have_key(:info)
          expect(response).to have_key(:options)
          expect(response).to have_key(:results)
          expect(response[:results]).to be_an(Array)
          expect(response[:results][0]).to have_key(:locations)
          expect(response[:results][0][:locations]).to be_a(Array)
          expect(response[:results][0][:locations][0]).to have_key(:latLng)
          expect(response[:results][0][:locations][0][:latLng]).to be_a(Hash)
          expect(response[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
          expect(response[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
        end
      end

      context 'sad path' do
        it 'returns an empty array if an invalid location is provided', :vcr do
          response = LatLongService.get_lat_long('fghfgh, fghfgh')

          expect(response[:results].first[:locations][0][:adminArea5]).to eq("")
        end
      end
    end
  end
end
