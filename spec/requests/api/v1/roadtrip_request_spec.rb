require 'rails_helper'

describe 'Roadtrip API' do
  it 'sends the roadtrip travel time and weather at eta', :vcr do
    User.create!(email: 'example@example.com',
                 password: 'password',
                 password_confirmation: 'password',
                 api_key: 'ghm983hy48thw9begh98h4536k2')

    request_body = {
      origin: 'Denver,CO',
      destination: 'Memphis,TN',
      api_key: 'ghm983hy48thw9begh98h4536k2'
    }
    headers = { CONTENT_TYPE: 'application/json', Accept: 'application/json' }

    post '/api/v1/road_trip', headers: headers, params: request_body.to_json

    expect(response).to be_successful
    expect(response.status).to eq(200)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to be_a(Hash)
    expect(json[:data]).to have_key(:id)
    expect(json[:data][:id]).to eq(nil)
    expect(json[:data]).to have_key(:type)
    expect(json[:data][:type]).to eq('roadtrip')

    expect(json[:data]).to have_key(:attributes)
    expect(json[:data][:attributes]).to be_a(Hash)
    expect(json[:data][:attributes].length).to eq(4)
    expect(json[:data][:attributes]).to have_key(:start_city)
    expect(json[:data][:attributes][:start_city]).to be_a(String)
    expect(json[:data][:attributes]).to have_key(:end_city)
    expect(json[:data][:attributes][:end_city]).to be_a(String)
    expect(json[:data][:attributes]).to have_key(:travel_time)
    expect(json[:data][:attributes][:travel_time]).to be_a(String)
    expect(json[:data][:attributes]).to have_key(:weather_at_eta)
    expect(json[:data][:attributes][:weather_at_eta]).to be_a(Hash)
    expect(json[:data][:attributes][:weather_at_eta].length).to eq(2)
    expect(json[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(json[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Numeric)
    expect(json[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    expect(json[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
  end

  it 'sends 401 error if user does not exist', :vcr do
    headers = { CONTENT_TYPE: 'application/json', Accept: 'application/json' }
    request_body = {
      origin: 'Denver,CO',
      destination: 'Memphis,TN',
      api_key: 'ghm983hy48thw9begh98h4536k2'
    }

    post '/api/v1/road_trip', headers: headers, params: request_body.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(401)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to be_a(Hash)
    expect(json).to_not be_empty
    expect(json.size).to eq(2)
    expect(json[:message]).to eq('Your request could not be completed.')
    expect(json[:errors]).to be_a(Array)
    expect(json[:errors]).to eq(['Bad credentials.'])
  end

  it 'sends 401 error if api key does not match', :vcr do
    request_body = {
      origin: 'Denver,CO',
      destination: 'Memphis,TN',
      api_key: 'ghm983hy48thw9begh98h4536k2'
    }
    headers = { CONTENT_TYPE: 'application/json', Accept: 'application/json' }

    post '/api/v1/road_trip', headers: headers, params: request_body.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(401)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to be_a(Hash)
    expect(json).to_not be_empty
    expect(json.size).to eq(2)
    expect(json[:message]).to eq('Your request could not be completed.')
    expect(json[:errors]).to be_a(Array)
    expect(json[:errors]).to eq(['Bad credentials.'])
  end

  it 'sends 401 if api key is not provided', :vcr do
    headers = { CONTENT_TYPE: 'application/json', Accept: 'application/json' }
    request_body = {
      origin: 'Denver,CO',
      destination: 'Pueblo,CO'
    }

    post '/api/v1/road_trip', headers: headers, params: request_body.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(401)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to be_a(Hash)
    expect(json).to_not be_empty
    expect(json.size).to eq(2)
    expect(json[:message]).to eq('Your request could not be completed.')
    expect(json[:errors]).to be_a(Array)
    expect(json[:errors]).to eq(['Bad credentials.'])
  end

  it 'sends message for impossible route', :vcr do
    User.create!(email: 'example@example.com',
                 password: 'password',
                 password_confirmation: 'password',
                 api_key: 'ghm983hy48thw9begh98h4536k2')

    request_body = {
      origin: 'Memphis,TN',
      destination: 'Rome, IT',
      api_key: 'ghm983hy48thw9begh98h4536k2'
    }
    headers = { CONTENT_TYPE: 'application/json', Accept: 'application/json' }

    post '/api/v1/road_trip', headers: headers, params: request_body.to_json

    expect(response).to be_successful
    expect(response.status).to eq(200)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to be_a(Hash)
    expect(json[:data]).to have_key(:id)
    expect(json[:data][:id]).to eq(nil)
    expect(json[:data]).to have_key(:type)
    expect(json[:data][:type]).to eq('roadtrip')
    expect(json[:data]).to have_key(:attributes)
    expect(json[:data][:attributes]).to be_a(Hash)
    expect(json[:data][:attributes].length).to eq(4)
    expect(json[:data][:attributes]).to have_key(:start_city)
    expect(json[:data][:attributes][:start_city]).to be_a(String)
    expect(json[:data][:attributes]).to have_key(:end_city)
    expect(json[:data][:attributes][:end_city]).to be_a(String)
    expect(json[:data][:attributes]).to have_key(:travel_time)
    expect(json[:data][:attributes][:travel_time]).to be_a(String)
    expect(json[:data][:attributes][:travel_time]).to eq('Impossible route')
    expect(json[:data][:attributes]).to have_key(:weather_at_eta)
    expect(json[:data][:attributes][:weather_at_eta]).to be_a(Hash)
    expect(json[:data][:attributes][:weather_at_eta].length).to eq(2)
    expect(json[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(json[:data][:attributes][:weather_at_eta][:temperature]).to eq(nil)
    expect(json[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    expect(json[:data][:attributes][:weather_at_eta][:conditions]).to eq(nil)
  end
end
