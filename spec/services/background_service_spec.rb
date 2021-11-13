require 'rails_helper'

RSpec.describe BackgroundService do
  describe 'class methods' do
    describe '.conn' do
      it 'establishes connection to the unsplash api' do
        connection = BackgroundService.conn

        expect(connection.headers).to include('Accept-Version')
      end
    end

    describe '.get_background', :vcr do
      it 'returns background based on location' do
        response = BackgroundService.get_background('denver,co')

        expect(response).to be_a(Hash)
        expect(response).to have_key(:total)
        expect(response[:total]).to be_a(Numeric)
        expect(response).to have_key(:total_pages)
        expect(response[:total_pages]).to be_a(Numeric)
        expect(response).to have_key(:results)
        expect(response[:results]).to be_a(Array)
        expect(response[:results][0]).to have_key(:id)
        expect(response[:results][0][:id]).to be_a(String)
        expect(response[:results][0]).to have_key(:created_at)
        expect(response[:results][0][:created_at]).to be_a(String)
        expect(response[:results][0]).to have_key(:updated_at)
        expect(response[:results][0][:updated_at]).to be_a(String)
        expect(response[:results][0]).to have_key(:promoted_at)
        expect(response[:results][0][:promoted_at]).to eq(nil)
        expect(response[:results][0]).to have_key(:width)
        expect(response[:results][0][:width]).to be_a(Numeric)
        expect(response[:results][0]).to have_key(:height)
        expect(response[:results][0][:height]).to be_a(Numeric)
        expect(response[:results][0]).to have_key(:color)
        expect(response[:results][0][:color]).to be_a(String)
        expect(response[:results][0]).to have_key(:blur_hash)
        expect(response[:results][0][:blur_hash]).to be_a(String)
        expect(response[:results][0]).to have_key(:description)
        expect(response[:results][0][:description]).to be_a(String)
        expect(response[:results][0]).to have_key(:alt_description)
        expect(response[:results][0]).to have_key(:urls)
        expect(response[:results][0][:urls]).to be_a(Hash)
      end
    end
  end
end
