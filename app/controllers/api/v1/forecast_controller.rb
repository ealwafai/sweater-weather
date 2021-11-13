class Api::V1::ForecastController < ApplicationController
  def index
    location = LocationFacade.get_lat_long(params[:location])
    forecast = ForecastFacade.get_forecast(location)

    json_response(ForecastSerializer.get_weather(forecast))
  end
end
