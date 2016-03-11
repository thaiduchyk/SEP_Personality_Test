require 'rails_helper'

RSpec.describe Overrides::SessionsController, type: :controller do
  include Devise::TestHelpers

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    user = FactoryGirl.create(:user)
    sign_in user
  end

  describe 'create' do
    context 'with valid parameters' do
      let(:user_attributes){ FactoryGirl.attributes_for(:user) }

      it 'sign in user' do
        post :create, user: user_attributes
        expect(current_user.email).to eq(user.email)
      end

      it 'responds status 200' do
        post :create, user: user_attributes
        expect(response.status).to eq(200)
      end

      it 'renders'
    end
  end
 end