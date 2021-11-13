class Api::V1::BackgroundsController < ApplicationController
  def index
    background = BackgroundFacade.get_background(params[:location])

    json_response(BackgroundSerializer.get_background(background, params[:location]))
  end
end
