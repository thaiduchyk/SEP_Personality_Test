class Api::V1::Auth::SessionsController < DeviseTokenAuth::SessionsController
   include Docs::Api::V1::Auth::SessionsController

  def create
    super do
      @resource.skip_password_validation = true
    end
  end
end
