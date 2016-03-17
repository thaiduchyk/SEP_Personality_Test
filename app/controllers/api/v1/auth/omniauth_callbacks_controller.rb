class Api::V1::Auth::OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController

  swagger_controller :omniauth_callbacks, "Oauth"

  swagger_api :redirect_callbacks do
    summary "Logs in user with oauth"
    param :form, :name, :string, :required, "Name"
    param :form, :surname, :string, :required, "Surname"
    param :form, :email, :string, :required, "Email"
    param :form, :password, :string, :required, "Password"
    param :form, :password_confirmation, :string, :required, "Password confirmation"
    response :unauthorized
    response :not_acceptable, "The request you made is not acceptable"

  end


  attr_reader :auth_params
  skip_before_action :set_user_by_token
  skip_after_action :update_auth_header

  def redirect_callbacks
    super
  end
end