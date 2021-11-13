class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  def password_error
    render json: {
      message: 'Your request could not be completed.',
      errors: ['Password confirmation must match password.']
    },
      status: :bad_request
  end

  def missing_field_error
    render json: {
      message: 'Your request could not be completed.',
      errors: ['All fields are required.']
    },
      status: :bad_request
  end

  def email_error
    render json: {
      message: 'Your request could not be completed.',
      errors: ['Email address has already been taken.']
    },
      status: :bad_request
  end
end
