require 'rails_helper'

RSpec.describe Api::V1::InvitesController, type: :controller do

  before(:each) do
    load "#{Rails.root}/db/seeds.rb"
    @user = FactoryGirl.create(:user)
    allow(controller).to receive_messages(:current_user => @user)
  end

  describe '#create' do
    context 'with valid params' do
      it 'saves new invite' do
        expect {post :create, { email: 'example@gmail.com' } }.to change(Invite, :count).by(1)
      end
    end
  end

end
