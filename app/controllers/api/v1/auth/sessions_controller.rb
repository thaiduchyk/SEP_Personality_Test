class Api::V1::Auth::SessionsController < DeviseTokenAuth::SessionsController
  skip_before_filter  :verify_authenticity_token

  swagger_controller :sessions, "User Management"

  swagger_api :create do
    summary "Creates new user"
    param :form, :email, :string, :required, "Email"
    param :form, :password, :string, :required, "Password"
    response :unauthorized
  end

end