class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController

  #skip_before_filter  :verify_authenticity_token
  swagger_controller :registrations, "User form registration"

  swagger_api :create do
    summary "Creates new user"
    param :form, :name, :string, :required, "Name"
    param :form, :surname, :string, :required, "Surname"
    param :form, :email, :string, :required, "Email"
    param :form, :password, :string, :required, "Password"
    param :form, :password_confirmation, :string, :required, "Password confirmation"
    response :forbidden
  end

  private

  def sign_up_params
    params.permit(:email, :password, :name, :surname, :password_confirmation, :valid)
  end
end