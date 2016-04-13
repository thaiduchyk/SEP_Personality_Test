class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController

  include Docs::Api::V1::Auth::RegistrationsController

  private
  def sign_up_params
    params.permit(:email, :password, :name, :surname, :password_confirmation, :valid)
  end
end