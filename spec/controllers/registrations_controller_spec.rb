require 'rails_helper'

RSpec.describe Users::RegistrationsController, :type => :controller do
  include Devise::TestHelpers

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'POST #create' do

    context 'with valid parametrs' do
      let(:user_attributes){ FactoryGirl.attributes_for(:user) }

      it 'user is saved' do
        expect{ post :create, user: user_attributes }.to change(User, :count).by(1)
      end

      it 'user is signed in' do
        post :create, user: user_attributes
        expect(subject.current_user).to_not eq(nil)
      end

    end

    context 'with invalid parametrs' do

      it 'user is not saved' do
        expect{post :create, user: {}}.to_not change(User, :count)
      end

      it 'user is not signed in' do
        post :create, user: {}
        expect(subject.current_user).to eq(nil)
      end

      it 'error return if email is already in use' do
        user = FactoryGirl.create(:user)
        post :create, { user: { :email => 'user@example.com', :password => user.password } }
        expect(controller.current_user).to be_nil
        expect(response.body).to eq('')
      end

    end
  end

end