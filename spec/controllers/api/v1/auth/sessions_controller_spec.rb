require 'rails_helper'

RSpec.describe Api::V1::Auth::SessionsController, type: :controller do
  include Devise::TestHelpers

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
  end

  context 'with valid parameters' do
    it 'signs in user' do
      post :create, {email: @user.email, password: @user.password }
      expect(subject.current_user).to_not eq(nil)
    end
    it 'responds with status 200' do
       post :create, {email: @user.email, password: @user.password }
       expect(response.status).to eq(200)
    end
  end

  context 'with invalid parameters' do
    context 'when credentials are bad' do
      it 'user is not signs in' do
        post :create, {email: ''}
        expect(subject.current_user).to eq(nil)
      end

      it 'user is not signs in' do
        post :create, {password: ''}
        expect(subject.current_user).to eq(nil)
      end

      it 'responds with status 401' do
        post :create, {email: '', password: ''}
        expect(response.status).to eq(401)
      end

      it 'need check error'
    end
  end




end
