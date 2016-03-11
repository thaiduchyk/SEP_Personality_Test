require 'rails_helper'

RSpec.describe Overrides::SessionsController, type: :controller do
  include Devise::TestHelpers

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'create' do
    context 'with valid parameters' do
      let(:user){ FactoryGirl.create(:user) }
      let(:user_attributes){ FactoryGirl.attributes_for(:user) }

      it 'sign in user' do
        post :create, user: user_attributes
        expect(current_user).to eq(user)
      end

      it 'responds status 200' do
        post :create, user: user_attributes
        expect(response.status).to eq(200)
      end

      it 'renders'
    end
  end
 end