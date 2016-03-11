class Overrides::SessionsController < DeviseTokenAuth::SessionsController
  def create
    super
  end
end