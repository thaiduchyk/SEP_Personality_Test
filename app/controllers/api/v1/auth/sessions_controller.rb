class Api::V1::Auth::SessionsController < DeviseTokenAuth::SessionsController
  #skip_before_filter  :verify_authenticity_token

  swagger_controller :sessions, "User Management"

  swagger_api :create do
    summary "Creates new user"
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

  def destroy
    # remove auth instance variables so that after_action does not run
    user = remove_instance_variable(:@resource) if @resource
    client_id = remove_instance_variable(:@client_id) if @client_id
    remove_instance_variable(:@token) if @token
    binding.pry
    if user and client_id and user.tokens[client_id]
      user.tokens.delete(client_id)
      user.skip_password_validation = true
      user.save!
      binding.pry
      yield if block_given?

      render_destroy_success
    else
      render_destroy_error
    end
  end
end
