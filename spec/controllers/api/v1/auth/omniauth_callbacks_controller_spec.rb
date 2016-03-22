require 'rails_helper'


RSpec.describe Api::V1::Auth::OmniauthCallbacksController, type: :controller do

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    @request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:linkedin]
    @request.env['omniauth.params'] = {}
    @request.env['HTTP_HOST'] = 'localhost:3000'
    @request.env['omniauth.params']['resource_class'] = 'User'
  end

  it 'signs in user' do
    get :redirect_callbacks, provider: 'linkedin'#, auth_origin_url: 'http://localhost:3000/home'  #, omniauth_window_type: 'sameWindow'

  end

end