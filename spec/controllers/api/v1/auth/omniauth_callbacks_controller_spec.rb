

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

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    @request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:linkedin]
    @request.env['omniauth.params'] = {}
    @request.env['HTTP_HOST'] = 'localhost:3000'
    @request.env['omniauth.params']['resource_class'] = 'User'
  end

  it 'signs in user' do
    get :redirect_callbacks, provider: 'linkedin'#, auth_origin_url: 'http://localhost:3000/home'  #, omniauth_window_type: 'sameWindow'

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