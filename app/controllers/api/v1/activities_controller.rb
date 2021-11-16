class Api::V1::ActivitiesController < ApplicationController
  def index
    location = LocationFacade.get_lat_long(params[:destination])
    forecast = ForecastFacade.get_forecast(location)
    activity_1 = ActivityFacade.get_activity('relaxation')
    activity_2 = ActivityFacade.get_activity(temp_activity(forecast))
    activities = [activity_1, activity_2]
    
    json_response(ActivitySerializer.get_activity(params[:destination], forecast, activities))
  end

  private

  def temp_activity(forecast)
    if forecast.current.temperature >= 60
      return 'recreational'
    elsif forecast.current.temperature < 60 && forecast.current.temperature >= 50
      return 'busywork'
    elsif forecast.current.temperature < 50
      return 'cooking'
    end
  end
end
