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

      it 'saves invite with correct user_id' do
        post :create, { email: 'example@gmail.com' }
        expect(Invite.first.user_id).to eq(subject.current_user.id)
      end

      it 'sends an email' do
        expect { post :create, { email: 'example@gmail.com' } }
            .to change { ActionMailer::Base.deliveries.count }.by(1)
      end

    end

    context 'with invalid params' do

      it 'doesnt save invite' do
        expect {post :create, { email: 'a' } }.not_to change(Invite, :count)
      end

      it 'renders correct json' do
        post :create, { email: 'a' }
        expect((JSON.parse(response.body))['errors']).to include('email')
      end

    end
  end

end
