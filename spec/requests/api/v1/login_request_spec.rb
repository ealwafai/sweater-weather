require 'rails_helper'

describe 'Login API' do
  it "sends the user api key", :vcr do
    User.create!(email: 'example@example.com',
                 password: 'password',
                 password_confirmation: 'password',
                 api_key: 'aaA459FFkdbd53E0358bY8U6d3k')

    request_body = {
      email: 'example@example.com',
      password: 'password'
    }
    headers = { CONTENT_TYPE: 'application/json', Accept: 'application/json' }

    post '/api/v1/sessions', headers: headers, params: request_body.to_json

    expect(response).to be_successful
    expect(response.status).to eq(200)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to be_a Hash
    expect(json[:data]).to have_key(:type)
    expect(json[:data][:type]).to be_a(String)
    expect(json[:data][:type]).to eq('users')
    expect(json[:data]).to have_key(:id)
    expect(json[:data][:id]).to be_a(String)
    expect(json[:data]).to have_key(:attributes)
    expect(json[:data][:attributes]).to be_a(Hash)
    expect(json[:data][:attributes].length).to eq(2)
    expect(json[:data][:attributes]).to have_key(:email)
    expect(json[:data][:attributes][:email]).to be_a(String)
    expect(json[:data][:attributes]).to have_key(:api_key)
    expect(json[:data][:attributes][:api_key]).to be_a(String)
    expect(json[:data][:attributes][:api_key].length).to eq(27)
  end

  it 'sends 400 error if password is incorrect' do
    User.create!(email: 'example@example.com',
                 password: 'password',
                 password_confirmation: 'password',
                 api_key: 'aaA459FFkdbd53E0358bY8U6d3k')

    request_body = {
      email: 'example@example.com',
      password: 'wrongpassword'
    }
    headers = { CONTENT_TYPE: 'application/json', Accept: 'application/json' }

    post '/api/v1/sessions', headers: headers, params: request_body.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(401)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to_not be_empty
    expect(json.size).to eq(2)
    expect(json[:message]).to eq('Your request could not be completed.')
    expect(json[:errors]).to be_an Array
    expect(json[:errors]).to eq(['Bad credentials.'])
  end

  it 'sends 400 error if email is invalid' do
    User.create!(email: 'example@example.com',
                 password: 'password',
                 password_confirmation: 'password',
                 api_key: 'aaA459FFkdbd53E0358bY8U6d3k')

    request_body = {
      email: 'incorrect@example.com',
      password: 'password'
    }
    headers = { CONTENT_TYPE: 'application/json', Accept: 'application/json' }

    post '/api/v1/sessions', headers: headers, params: request_body.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(401)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to_not be_empty
    expect(json.size).to eq(2)
    expect(json[:message]).to eq('Your request could not be completed.')
    expect(json[:errors]).to be_an Array
    expect(json[:errors]).to eq(['Bad credentials.'])
  end
end
