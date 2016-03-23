require 'rails_helper'

RSpec.describe Api::V1::Auth::RegistrationsController, type: :controller do

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  let(:user_attributes){ FactoryGirl.attributes_for(:user) }

  let(:invalid_attributes){ FactoryGirl.attributes_for(:user_not_valid) }

  context 'with valid parameters' do
    user = FactoryGirl.build(:user)

    it 'signs in user' do
      post :create, user_attributes
      expect(subject.current_user.email).to eq(user.email)
    end

    it 'responds with status 200' do
      post :create, user_attributes
      expect(response.status).to eq(200)
    end

    it 'saves user' do
      expect{ post :create, user_attributes }.to change(User, :count).by(1)
    end

    it 'renders correct user' do
      post :create, user_attributes
      expect((JSON.parse(response.body))['data']['email']).to eq(user.email)
    end

  end

  context 'with invalid parameters' do

    it 'doesnt save user' do
      expect{post :create, invalid_attributes}.to_not change(User, :count)
    end

    it 'responds with status 403' do
      post :create, invalid_attributes
      expect(response.status).to eq(403)
    end

    it 'renders correct errors' do
      post :create, invalid_attributes
      expect((JSON.parse(response.body))['status']).to eq('error')
      expect((JSON.parse(response.body))['errors']).to include('name', 'surname', 'password', 'email')
    end

  end

  context 'then email is in database' do

    before (:each) do
      @user = FactoryGirl.create(:user)
    end

    it 'doesnt save user' do
      expect{post :create, user_attributes}.to_not change(User, :count)
    end

    it 'responds with status 403' do
      post :create, user_attributes
      expect(response.status).to eq(403)
    end

    it 'renders correct errors' do
      post :create, user_attributes
      expect((JSON.parse(response.body))['status']).to eq('error')
      expect((JSON.parse(response.body))['errors']).to include('email')
      expect((JSON.parse(response.body))['errors']['full_messages']).to include('Email already in use')
    end

  end

end