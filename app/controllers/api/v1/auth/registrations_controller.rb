class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController

  if Rails.env == 'development'
    include Docs::Api::V1::Auth::RegistrationsController
  end

  private
  def sign_up_params
    params.permit(:email, :password, :name, :surname, :password_confirmation, :valid)
  end
end