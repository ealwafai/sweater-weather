class Api::V1::ActivitiesController < ApplicationController
  def index
    location = LocationFacade.get_lat_long(params[:destination])
    forecast = ForecastFacade.get_forecast(location)
    activity1 = ActivityFacade.get_activity('relaxation')
    activity2 = ActivityFacade.get_activity(temp_activity(forecast))
    activities = [activity1, activity2]

    json_response(ActivitySerializer.get_activity(params[:destination], forecast, activities))
  end

  private

  def temp_activity(forecast)
    current_temp = forecast.current.temperature

    return 'recreational' if current_temp >= 60
    return 'busywork' if current_temp < 60 && current_temp >= 50
    return 'cooking' if current_temp < 50
  end
end
