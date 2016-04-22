require 'rails_helper'

RSpec.describe Api::V1::InvitesController, type: :controller do

  describe '#create' do

    before(:each) do
      load "#{Rails.root}/db/seeds.rb"
      @user = FactoryGirl.create(:user)
      allow(controller).to receive_messages(:current_user => @user)
    end

    context 'with valid params' do

      it 'saves new invite' do
        expect {post :create, { email: 'example@gmail.com' } }.to change(Invite, :count).by(1)
      end

      it 'saves invite with correct user' do
        post :create, { email: 'example@gmail.com' }
        expect(Invite.first.user_id).to eq(subject.current_user.id)
      end

      it 'sends an email' do
        expect { post :create, { email: 'example@gmail.com' } }
            .to change { ActionMailer::Base.deliveries.count }.by(1)
      end

      it 'responds with status 200' do
        post :create, { email: 'example@gmail.com' }
        expect(response.status).to eq(200)
      end

    end

    context 'with invalid params' do

      it 'doesnt save invite' do
        expect {post :create, { email: 'a' } }.not_to change(Invite, :count)
      end

      it 'renders correct error' do
        post :create, { email: 'a' }
        expect((JSON.parse(response.body))['errors']).to include('email')
      end

      it 'responds with error status' do
        post :create, { email: 'a' }
        expect((JSON.parse(response.body))['status']).to eq('error')
      end

      it 'responds with status 403' do
        post :create, { email: 'a' }
        expect(response.status).to eq(403)
      end

    end
  end

  describe '#check_invite' do

    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    context 'with valid params' do

      before(:each) do
        load "#{Rails.root}/db/seeds.rb"
        @invite = FactoryGirl.create(:invite, user: @user)
      end

      it 'find and assign correct invite' do
        post :check_invite, { email: @invite.email, token: @invite.token }
        expect(assigns(:check_invite)).to eq(@invite)
      end

      it 'renders all personalities' do
        post :check_invite, { email: @invite.email, token: @invite.token }
        expect((JSON.parse(response.body))['data'].map { |p| p['id'] }).to eq(Personality.all.map { |p| p['id'] })
      end

      it 'renders user' do
        post :check_invite, { email: @invite.email, token: @invite.token }
        expect((JSON.parse(response.body))['user']['email']).to eq(@user.email)
      end

      it 'responds with status 200' do
        post :check_invite, { email: @invite.email, token: @invite.token }
        expect(response.status).to eq(200)
      end

    end

    context 'with invalid params' do

      context 'then friend already passed test' do

        before(:each) do
          @invite = FactoryGirl.create(:invite, user: @user, passed: true)
        end

        it 'renders correct error' do
          post :check_invite, { email: @invite.email, token: @invite.token }
          expect((JSON.parse(response.body))['errors']).to eq('already passed')
        end

        it 'responds with error status' do
          post :check_invite, { email: @invite.email, token: @invite.token }
          expect((JSON.parse(response.body))['status']).to eq('error')
      end

        it 'responds with status 403' do
          post :check_invite, { email: @invite.email, token: @invite.token }
          expect(response.status).to eq(403)
        end

      end

      context 'with invalid token' do

        before(:each) do
          @invite = FactoryGirl.create(:invite, user: @user)
        end

        it 'renders correct error' do
          post :check_invite, { email: @invite.email, token: ' ' }
          expect((JSON.parse(response.body))['errors']).to eq('token not valid')
        end

        it 'responds with error status' do
          post :check_invite, { email: @invite.email, token: ' ' }
          expect((JSON.parse(response.body))['status']).to eq('error')
        end

        it 'responds with status 403' do
          post :check_invite, { email: @invite.email, token: ' ' }
          expect(response.status).to eq(403)
        end

      end

      context 'then invite wasnt sent to email' do

        before(:each) do
          @invite = FactoryGirl.create(:invite, user: @user)
        end

        it 'renders correct error' do
          post :check_invite, { email: 'notexisting@gmail.com', token: @invite.token }
          expect((JSON.parse(response.body))['errors']).to eq('invite not send on email')
        end

        it 'responds with error status' do
          post :check_invite, { email: 'notexisting@gmail.com', token: @invite.token }
          expect((JSON.parse(response.body))['status']).to eq('error')
        end

        it 'responds with status 403' do
          post :check_invite, { email: 'notexisting@gmail.com', token: @invite.token }
          expect(response.status).to eq(403)
        end

      end

    end

  end

end
