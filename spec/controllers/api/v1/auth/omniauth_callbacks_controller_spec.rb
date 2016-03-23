require 'rails_helper'


RSpec.describe Api::V1::Auth::OmniauthCallbacksController, type: :controller do

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    @request.env['omniauth.params'] = {'resource_class'=>'User'}
    @request.env['HTTP_HOST'] = 'localhost:3000'
    @request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:linkedin]
  end

  describe '#redirect_callbacks' do

    it 'redirects to omniauth_success' do
        get :redirect_callbacks, provider: 'linkedin'
        expect(response).to redirect_to('http://localhost:3000//api/v1/auth/linkedin/callback')
    end

  end

  describe '#omniauth_success' do

     context 'then user exists' do
        before (:each) do
          @user = FactoryGirl.create(:user)
          session['dta.omniauth.auth'] = request.env['omniauth.auth'].except('extra')
        end

        it 'signs in user' do
          get :omniauth_success, provider: 'linkedin'
          expect(subject.current_user.email).to eq(@user.email)
        end

        it 'responds with status 200' do
          get :omniauth_success, provider: 'linkedin'
          expect(response.status).to eq(200)
        end

        it 'renders correct user' do
          get :omniauth_success, provider: 'linkedin'
          expect((JSON.parse(response.body))['data']['email']).to eq(@user.email)
        end
     end
    
  end

end