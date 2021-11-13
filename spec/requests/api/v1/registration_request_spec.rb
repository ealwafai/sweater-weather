require 'rails_helper'

describe 'Registration API' do
  it 'creates user and generates unique api key that belongs to user' do
    user_params = {
      email: 'whatever@example.com',
      password: 'password',
      password_confirmation: 'password'
    }
    headers = { CONTENT_TYPE: 'application/json', Accept: 'application/json' }

    post '/api/v1/users', headers: headers, params: user_params.to_json

    expect(response).to be_successful
    expect(response.status).to eq(201)

    user = JSON.parse(response.body, symbolize_names: true)

    expect(User.last.email).to eq(user_params[:email])

    expect(user).to be_a(Hash)
    expect(user[:data]).to have_key(:type)
    expect(user[:data][:type]).to be_a(String)
    expect(user[:data][:type]).to eq('users')
    expect(user[:data]).to have_key(:id)
    expect(user[:data][:id]).to be_a(String)
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to be_a(Hash)
    expect(user[:data][:attributes].length).to eq(2)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes][:email]).to be_a(String)
    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes][:api_key]).to be_a(String)
    expect(user[:data][:attributes][:api_key].length).to eq(27)
    expect(user[:data]).to_not have_key(:password)
    expect(user[:data][:attributes]).to_not have_key(:password)
  end

  it 'returns 400 status if password and password confirmation do not match' do
    user_params = {
      email: 'whatever@example.com',
      password: 'password',
      password_confirmation: 'differentpassword'
    }
    headers = { CONTENT_TYPE: 'application/json', Accept: 'application/json' }

    post '/api/v1/users', headers: headers, params: user_params.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to_not be_empty
    expect(json.size).to eq(2)
    expect(json[:message]).to eq('Your request could not be completed.')
    expect(json[:errors]).to be_an(Array)
    expect(json[:errors]).to eq(['Password confirmation must match password.'])
  end

  it 'returns 400 status if field is missing' do
    user_params = {
      password: 'password'
    }
    headers = { CONTENT_TYPE: 'application/json', Accept: 'application/json' }

    post '/api/v1/users', headers: headers, params: user_params.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to_not be_empty
    expect(json.size).to eq(2)
    expect(json[:message]).to eq('Your request could not be completed.')
    expect(json[:errors]).to be_an(Array)
    expect(json[:errors]).to eq(['All fields are required.'])
  end

  it 'returns 400 status if email has already been taken' do
    User.create!(email: 'whatever@example.com',
                 password: 'password',
                 password_confirmation: 'password',
                 api_key: 'ddf5g1d6f5gdf65g4dfg54dgd')

    user_params = {
      email: User.last.email,
      password: 'password',
      password_confirmation: 'password'
    }
    headers = { CONTENT_TYPE: 'application/json', Accept: 'application/json' }

    post '/api/v1/users', headers: headers, params: user_params.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to_not be_empty
    expect(json.size).to eq(2)
    expect(json[:message]).to eq('Your request could not be completed.')
    expect(json[:errors]).to be_an(Array)
    expect(json[:errors]).to eq(['Email address has already been taken.'])
  end
end
