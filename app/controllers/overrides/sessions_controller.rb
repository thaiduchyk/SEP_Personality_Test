class Overrides::SessionsController < DeviseTokenAuth::SessionsController
  skip_before_filter  :verify_authenticity_token
end