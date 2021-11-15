require 'rails_helper'

describe 'Bored API' do
  it 'sends activities based on city and temperature', :vcr do
    params = { destination: 'chicago,il' }

    headers = { CONTENT_TYPE: 'application/json', Accept: 'application/json' }

    get '/api/v1/activities', headers: headers, params: params

    expect(response).to be_successful
    expect(response.status).to eq(200)

    activities = JSON.parse(response.body, symbolize_names: true)

    expect(activities).to be_a Hash
    expect(activities[:data]).to have_key(:id)
    expect(activities[:data][:id]).to eq(nil)
    expect(activities[:data]).to have_key(:type)
    expect(activities[:data][:type]).to eq('activities')

    expect(activities[:data]).to have_key(:attributes)
    expect(activities[:data][:attributes].length).to eq(3)
    expect(activities[:data][:attributes]).to have_key(:destination)
    expect(activities[:data][:attributes][:destination]).to be_a(String)
    expect(activities[:data][:attributes]).to have_key(:forecast)
    expect(activities[:data][:attributes][:forecast].length).to eq(2)
    expect(activities[:data][:attributes][:forecast]).to have_key(:summary)
    expect(activities[:data][:attributes][:forecast][:summary]).to be_a String
    expect(activities[:data][:attributes][:forecast]).to have_key(:temperature)
    expect(activities[:data][:attributes][:forecast][:temperature]).to be_a(String)
    expect(activities[:data][:attributes]).to have_key(:activities)
    expect(activities[:data][:attributes][:activities]).to be_an(Array)
    activities[:data][:attributes][:activities].each do |activity|
      expect(activity).to have_key(:title)
      expect(activity[:title]).to be_a(String)
      expect(activity).to have_key(:type)
      expect(activity[:type]).to be_a(String)
      expect(activity).to have_key(:participants)
      expect(activity[:participants]).to be_a(Integer)
      expect(activity).to have_key(:price)
    end
  end
end

#Assignment:
# You will be using the Bored API to find activities once you read a destination city provided by the user. Presume that your user will give a known "good" location. (you can handle edge cases later)
# Your endpoint should follow this format:
# GET /api/v1/activities?destination=chicago,il
# please do not deviate from the names of the endpoint or query parameter, be sure it is called "activities" and "destination", respectively
# Your API will return:
# the destination city
# the forecast in that city right now
# Two activities that would be suitable given the weather:
# for all temperatures, include one relaxation activity
# if the temperature is >= 60 F, include one recreational activity.
# if the temperature is >= 50 F and < 60 F, include one busywork activity.
# if the temperature is < 50 F, include one cooking activity.
# Your response should be in the format below:
# # {
#   "data": {
#     "id": "null",
#     "type": "activities",
#     "attributes": {
#       "destination": "chicago,il",
#       "forecast": {
#         "summary": "Cloudy with a chance of meatballs",
#         "temperature": "45 F"
#       },
#       "activities": [
#           {"title": "Learn a new recipe",
#           "type": "cooking",
#           "participants": 1,
#           "price": 0},
#           {"title: "Take a bubble bath",
#           "type": "relaxation",
#           "participants": 1,
#           "price": 0.5
#         }]
#       }
#     }
#   }
