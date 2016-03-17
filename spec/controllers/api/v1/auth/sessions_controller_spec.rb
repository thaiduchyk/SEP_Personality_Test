require 'rails_helper'

RSpec.describe Api::V1::Auth::SessionsController, type: :controller do

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  context 'with valid parameters' do

    it 'signs in user' do
      post :create, {email:'', password:''}

      expect(subject.current_user).to_not eq(nil)
    end

    it 'responds status with status 200' do
      post :create, user_attributes
      expect(response.status).to eq(200)
    end

  end
end