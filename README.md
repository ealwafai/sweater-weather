# Sweater Weather

## Table of Contents

- [Overview](#overview)
- [Learning Goals](#learning-goals)
- [Local Setup](#local-setup)
- [Setup](#setup)
- [System Dependencies](#system-dependencies)
- [Configuration](#configuration)
- [Tools Used](#tools-used)
- [Contributors](#contributors)

## Overview

Sweater Weather is a 1 week, single person project, during Mod 3 of 4 for Turing School's Back End Engineering Program.

The scenario is that I am working for a company developing an E-Commerce Application. The team is working in a service-oriented architecture, meaning the front and back ends of this application are separate and communicate via APIs. My job is to expose the data that powers the site through an API that the front end will consume.

Find the project spec [here](https://backend.turing.edu/module3/projects/rails_engine/)

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
