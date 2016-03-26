class Api::V1::Auth::SessionsController < DeviseTokenAuth::SessionsController
  #skip_before_filter  :verify_authenticity_token

  swagger_controller :sessions, "User Management"

  swagger_api :create do
    summary "Creates new user"
    param :header, :token, :string, :required, "token to be passed as a header" , :in =>'header'
    param :form, :email, :string, :required, "Email"
    param :form, :password, :string, :required, "Password"
    response :unauthorized
  end

  swagger_api :destroy do
    summary "Deletes an existing User item"
    param :path, :id, :integer, :optional, "User Id"
    response :unauthorized
    response :not_found
  end


  def create
    super do
      @resource.skip_password_validation = true
    end
  end


end
