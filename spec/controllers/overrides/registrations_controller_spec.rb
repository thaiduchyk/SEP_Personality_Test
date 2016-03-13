require 'rails_helper'

RSpec.describe Overrides::RegistrationsController, type: :controller do
  include Devise::TestHelpers

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  context 'with valid parameters' do

    let(:user_attributes){ FactoryGirl.attributes_for(:user) }

    it 'signs in user' do
      post :create, user_attributes
      expect(subject.current_user).to_not eq(nil)
    end

    it 'responds status with status 200' do
      post :create, user_attributes
      expect(response.status).to eq(200)
    end

    it 'saves user' do
      expect{ post :create, user_attributes }.to change(User, :count).by(1)
    end

    it 'renders correct json'
  end

  context 'with invalid parameters' do

    it 'doesnt save user' do
      expect{post :create, {}}.to_not change(User, :count)
    end

    it 'doesnt sign in user' do
      post :create, {}
      expect(subject.current_user).to eq(nil)
    end

    it 'error return if email is already in use' do
    end

  end
end