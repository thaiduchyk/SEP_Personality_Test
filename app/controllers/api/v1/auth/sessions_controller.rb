class Api::V1::Auth::SessionsController < DeviseTokenAuth::SessionsController

  if Rails.env == 'development'
   include Docs::Api::V1::Auth::SessionsController
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
    if user and client_id and user.tokens[client_id]
      user.tokens.delete(client_id)
      user.skip_password_validation = true
      user.save!
      yield if block_given?

      render_destroy_success
    else
      render_destroy_error
    end
  end

end
