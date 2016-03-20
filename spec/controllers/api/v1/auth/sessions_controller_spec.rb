require 'rails_helper'

RSpec.describe Api::V1::Auth::SessionsController, type: :controller do
  include Devise::TestHelpers
  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]

  end

  context 'with valid parameters' do
    before (:each) do
      @user = FactoryGirl.create(:user)
    end

    it 'signs in user' do
      post :create, {email:@user.email, password:@user.password}
      expect(subject.current_user).to_not eq(nil)
    end

    it 'responds status with status 200' do
       post :create, {email:@user.email, password:@user.password}
       expect(response.status).to eq(200)
    end

  end
end