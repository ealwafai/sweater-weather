require 'rails_helper'

RSpec.describe ActivityService do
  describe 'class methods' do
    describe '.conn' do
      it 'establishes connection to the bored api' do
        connection = ActivityService.conn

        expect(connection).to be_a(Faraday::Connection)
      end
    end

    describe '.get_activity', :vcr do
      it 'returns a random activity' do
        type = 'recreational'
        response = ActivityService.get_activity(type)

        expect(response).to be_a(Hash)
        expect(response.keys).to eq([:activity, :type, :participants, :price, :link, :key, :accessibility])
        expect(response[:activity]).to be_a(String)
        expect(response[:type]).to be_a(String)
        expect(response[:participants]).to be_an(Integer)
        # expect(response[:price]).to be_a(Integer)
        expect(response[:link]).to be_a(String)
        expect(response[:key]).to be_a(String)
        expect(response[:accessibility]).to be_a(Float)
      end
    end
  end
end
