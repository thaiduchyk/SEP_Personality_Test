class Api::V1::Overrides::SessionsController < DeviseTokenAuth::SessionsController
  skip_before_filter  :verify_authenticity_token

  swagger_controller :sessions, "User Management"

  swagger_api :create do
    summary "Creates new user"
    param :form, :email, :string, :required, "Email"
    param :form, :password, :string, :required, "Password"
    response :unauthorized
    response :not_acceptable, "The request you made is not acceptable"
  end


end