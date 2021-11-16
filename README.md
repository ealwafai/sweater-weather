# Sweater Weather
<br>
<img src="https://user-images.githubusercontent.com/77654906/141661694-244da0a6-e8b6-4de4-980a-260d56c5f8c4.jpeg" width="85%">

<br>

## Table of Contents

- [Overview](#overview)
- [Learning Goals](#learning-goals)
- [Local Setup](#local-setup)
- [Setup](#setup)
- [System Dependencies](#system-dependencies)
- [Configuration](#configuration)
- [Endpoints](#endpoints)
- [Tools Used](#tools-used)
- [Contributors](#contributors)

## Overview

Sweater Weather is a 1 week, single person project, during Mod 3 of 4 for Turing School's Back End Engineering Program. It is a web application that allows users to plan for a road trip by checking the weather forecast at their destination city.

This API consumes three third-party APIs and aggregates the data to return the requested information.
* Unsplash developers for utilization of pictures.
* Mapquest Developer to give directions for a road trip and the trip timing along with latitude and longitude.
* Openweather API which was used to get the weather for a desired location or for the road trip

Find the project spec [here](https://backend.turing.edu/module3/projects/sweater_weather/requirements)

## Learning Goals

* Expose an API that aggregates data from multiple external APIs
* Expose an API that requires an authentication token
* Expose an API for CRUD functionality
* Determine completion criteria based on the needs of other developers
* Research, select, and consume an API based on your needs as a developer

## Local Setup

This project requires Ruby 2.7.2.

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
`bundle`
`bundle update`
`rails db:create`
* Run the test suite with `bundle exec rspec`.
* Run your development server with `rails s` to see the app in action.

## Setup
* Ruby version
```
$ ruby -v
ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin20]
```

* System dependencies
```
$ rails -v
Rails 5.2.6
```

* Database creation
```
$ rails db:{create,migrate}
```

* How to run the test suite
```
$ bundle exec rspec
```

* Local Deployment, for testing:
```
$ rails s
=> Booting Puma
=> Rails 5.2.6 application starting in development
=> Run `rails server -h` for more startup options
Puma starting in single mode...
* Version 3.12.6 (ruby 2.7.2-p137), codename: Llamas in Pajamas
* Min threads: 5, max threads: 5
* Environment: development
* Listening on tcp://localhost:3000
Use Ctrl-C to stop
```

## System Dependencies

Sign up for the MapQuest Developer, Open Weather Map, and Unsplash api keys.

* MapQuest Developer API
  * Sign up for an account with MapQuest
  * Then, get your key here then select Create a New Key and fill in required fields.
* Open Weather Map API
  * Sign up
  * Go to your API keys, fill in API key name, and select Generate.
* Unsplash API
  * First, login or join
  * Then register your application. Go to your apps, click New Application, and fill in the required details.
  * NOTE: All applications must follow the API Guidelines, including properly providing attribution for the photographer and Unsplash.


## Configuration

* Clone this repo
* Run bundle
* Run bundle exec figaro install
* Open your config/application.yml file in your code editor (You may have to open it manually). Then, add to the bottom of the config/application.yml file your api keys:
```
forecast_key: <your_open_weather_api_key>
mapquest_key: <your_mapquest_api_key>
unsplash_key: Client-ID <your_unsplash_api_key>
```

## Endpoints

### Retrieve Weather for a City
#### Request
```
GET /api/v1/forecast?location=denver,co
Content-Type: application/json
Accept: application/json
```

#### 200 Response
```
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2021-11-16 23:08:26 UTC",
                "sunrise": "2021-11-16 13:46:09 UTC",
                "sunset": "2021-11-16 23:43:41 UTC",
                "temperature": 64.56,
                "feels_like": 61.56,
                "humidity": 18,
                "uvi": 0.2,
                "visibility": 10000,
                "conditions": "overcast clouds",
                "icon": "04d"
            },
            "daily_weather": [
                {
                    "date": "2021-11-16 18:00:00 UTC",
                    "sunrise": "2021-11-16 13:46:09 UTC",
                    "sunset": "2021-11-16 23:43:41 UTC",
                    "max_temp": 66.65,
                    "min_temp": 46.8,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "date": "2021-11-17 18:00:00 UTC",
                    "sunrise": "2021-11-17 13:47:17 UTC",
                    "sunset": "2021-11-17 23:42:57 UTC",
                    "max_temp": 42.98,
                    "min_temp": 34.63,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "date": "2021-11-18 18:00:00 UTC",
                    "sunrise": "2021-11-18 13:48:26 UTC",
                    "sunset": "2021-11-18 23:42:16 UTC",
                    "max_temp": 49.24,
                    "min_temp": 32.27,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2021-11-19 18:00:00 UTC",
                    "sunrise": "2021-11-19 13:49:34 UTC",
                    "sunset": "2021-11-19 23:41:36 UTC",
                    "max_temp": 61.65,
                    "min_temp": 43.93,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "date": "2021-11-20 18:00:00 UTC",
                    "sunrise": "2021-11-20 13:50:41 UTC",
                    "sunset": "2021-11-20 23:40:58 UTC",
                    "max_temp": 58.75,
                    "min_temp": 44.8,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "hourly_weather": [
                {
                    "time": "2021-11-16 23:00:00 UTC",
                    "temperature": 64.56,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "time": "2021-11-17 00:00:00 UTC",
                    "temperature": 63.77,
                    "conditions": "overcast clouds",
                    "icon": "04n"
                },
                {
                    "time": "2021-11-17 01:00:00 UTC",
                    "temperature": 62.2,
                    "conditions": "overcast clouds",
                    "icon": "04n"
                },
                {
                    "time": "2021-11-17 02:00:00 UTC",
                    "temperature": 60.12,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "2021-11-17 03:00:00 UTC",
                    "temperature": 57.11,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "2021-11-17 04:00:00 UTC",
                    "temperature": 53.19,
                    "conditions": "scattered clouds",
                    "icon": "03n"
                },
                {
                    "time": "2021-11-17 05:00:00 UTC",
                    "temperature": 48.88,
                    "conditions": "few clouds",
                    "icon": "02n"
                },
                {
                    "time": "2021-11-17 06:00:00 UTC",
                    "temperature": 46.8,
                    "conditions": "few clouds",
                    "icon": "02n"
                }
            ]
        }
    }
}
```

### Background Image for a City
#### Request
```
GET /api/v1/backgrounds?location=denver,co

Content-Type: application/json
Accept: application/json
```

#### 200 Response
```
{
    "data": {
        "id": null,
        "type": "image",
        "attributes": {
            "image": {
                "description": {
                    "description": "8pm curfew was lifted.",
                    "alt_description": null,
                    "location": "denver,co\n"
                },
                "image_url": "https://images.unsplash.com/photo-1634507307973-9df1b23f5701?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNzU0MTF8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwxfDB8fHwxNjM3MTA0MzY5&ixlib=rb-1.2.1&q=80&w=1080",
                "credit": {
                    "source": "upsplash.com",
                    "photographer": "Dillon Wanner",
                    "profile": "https://unsplash.com/@dillydallying",
                    "logo": "https://unsplash.com/blog/content/images/max/2560/1-VnKoValwGK3-d1bZhD6sVA.jpeg",
                    "utm_source": "Sweater Weather",
                    "utm_medium": "referral"
                }
            }
        }
    }
}

```

### Activities Search
Request

 `GET /api/v1/activities?destination=chicago,il`

#### 200 Response
```
{
    "data": {
        "id": null,
        "type": "activities",
        "attributes": {
            "destination": "chicago,il",
            "forecast": {
                "summary": "broken clouds",
                "temperature": "47.07 F"
            },
            "activities": [
                {
                    "title": "Go to a nail salon",
                    "type": "relaxation",
                    "participants": 1,
                    "price": 0.4
                },
                {
                    "title": "Make bread from scratch",
                    "type": "cooking",
                    "participants": 1,
                    "price": 0.2
                }
            ]
        }
    }
}
```

### User Registration
#### Request
```
POST /api/v1/users
Content-Type: application/json
Accept: application/json
{
  "email": "123@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```

#### 200 Response
```
{
    "data": {
        "type": "users",
        "id": "2",
        "attributes": {
            "email": "123@example.com",
            "api_key": "vCYWVWLUjcNqIKLen0pZAgYHJkv"
        }
    }
}
```

### Login
#### Request
```
POST /api/v1/sessions
Content-Type: application/json
Accept: application/json
{
  "email": "123@example.com",
  "password": "password"
}
```

#### 200 Response
```
{
    "data": {
        "type": "users",
        "id": "2",
        "attributes": {
            "email": "123@example.com",
            "api_key": "vCYWVWLUjcNqIKLen0pZAgYHJkv"
        }
    }
}
```

### Road Trip
#### Request
```
POST /api/v1/road_trip
Content-Type: application/json
Accept: application/json
body:
{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "vCYWVWLUjcNqIKLen0pZAgYHJkv"
}
```

#### 200 Response
```
{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver,CO",
            "end_city": "Pueblo,CO",
            "travel_time": "1 hr, 45 min",
            "weather_at_eta": {
                "temperature": 71.37,
                "conditions": "clear sky"
            }
        }
    }
}
```


## Tools Used

| Development | Testing       | Gems          |
|   :----:    |    :----:     |    :----:     |
| Ruby 2.7.2  | RSpec         | SimpleCov     |
| Rails 5.2.6 | Rubocop       | Pry           |
| Github      |               | Bootstrap     |
| Atom        |               | ShouldaMatcher|
| Postman     |               | VCR           |
|             |               | Webmock       |
|             |               | PostgresQL    |
|             |               | Postico       |
|             |               | Faker         |
|             |               | Factorybot    |
|             |               | Faraday       |
|             |               | Bcrypt        |
|             |               | Figaro        |
|             |               |               |


## Contributors

👤  **Ezzedine Alwafai**
- [GitHub](https://github.com/ealwafai)
- [LinkedIn](https://www.linkedin.com/in/ezzedine-alwafai/)
