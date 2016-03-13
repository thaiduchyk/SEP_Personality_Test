class Overrides::RegistrationsController < DeviseTokenAuth::RegistrationsController
  skip_before_filter  :verify_authenticity_token

  def create
    super
  end

  def sign_up_params
    params.permit(:name, :surname, :email, :password, :password_confirmation)
  end

end