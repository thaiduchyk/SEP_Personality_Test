class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController

  def sign_up_params
    params.permit(:email, :password, :name, :surname, :password_confirmation)
  end

  swagger_controller :registrations, "User Management"

  swagger_api :create do
    summary "Creates new user"
    param :form, :name, :string, :required, "Name"
    param :form, :surname, :string, :required, "Surname"
    param :form, :email, :string, :required, "Email"
    param :form, :password, :string, :required, "Password"
    param :form, :password_confirmation, :string, :required, "Password confirmation"
    response :unauthorized
    response :not_acceptable, "The request you made is not acceptable"

  end

end