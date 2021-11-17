class Api::V1::RoadtripsController < ApplicationController
  def create
    user = User.find_by(api_key: roadtrip_params[:api_key])

    if user.nil? || params[:api_key].nil?
      bad_credentials_error
    elsif RoadtripFacade.get_roadtrip(roadtrip_params[:origin], roadtrip_params[:destination]) == 402
      json_response(RoadtripSerializer.impossible_route(roadtrip_params))
    else
      roadtrip = RoadtripFacade.get_roadtrip(roadtrip_params[:origin], roadtrip_params[:destination])
      destination_weather = ForecastFacade.get_hourly_only(LocationFacade.get_lat_long(roadtrip_params[:destination]))
      json_response(RoadtripSerializer.get_roadtrip(roadtrip, destination_weather))
    end
  end

  private

  def roadtrip_params
    params.permit(:origin, :destination, :api_key)
  end
end
