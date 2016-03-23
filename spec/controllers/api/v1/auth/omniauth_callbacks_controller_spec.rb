require 'rails_helper'

RSpec.describe Api::V1::Auth::OmniauthCallbacksController, type: :controller do
  include Devise::TestHelpers
  before(:each) do
    OmniAuth.config.mock_auth[:facebook] = {
        'provider' => 'facebook',
       'uid' => '123545',
       'user_info'=>
           { 'email'=>'test@gmail.com'
           }
   }

    request.env['devise.mapping'] = Devise.mappings[:user]
    request.env['omniauth.params'] = OmniAuth.config.mock_auth[:facebook]
    binding.pry
    request.env['omniauth.params']['resource_class'] = 'User'
    binding.pry
  end


  describe 'GET /auth/facebook/callback' do
    binding.pry
    it 'testing omniauth hash' do
      binding.pry
      get '/api/v1/auth/facebook/callback'
      binding.pry
     # request.env['omniauth.auth'][:uid].should == '123545'
    end
  end




end
