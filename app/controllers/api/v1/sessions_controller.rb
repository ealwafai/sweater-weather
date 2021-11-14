class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by_email(session_params[:email])

    if user && user.authenticate(session_params[:password])
      json_response(SessionSerializer.authenticated_user(user))
    else
      bad_credentials_error
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
