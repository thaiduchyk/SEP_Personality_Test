require 'rails_helper'

RSpec.describe Users::RegistrationsController, :type => :controller do
  include Devise::TestHelpers

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end


  describe "POST 'create'" do

    context "With valid parametrs" do
      before(:each) do
        @attr = { name: 'Name', surname: 'Surname', email:  'user@example.com',
                  password: 'foobar01', password_confirmation: 'foobar01' }
      end

      it 'user is saved' do
        expect{post :create, :user => @attr}.to change(User, :count).by(1)
      end

      it 'user is signed in' do
        post :create, :user => @attr
        expect(subject.current_user).to_not eq(nil)
      end
    end

    context "With invalid parametrs" do

      it 'user is not saved' do
        expect{post :create, :user => {}}.to_not change(User, :count)
      end

      it 'user is not signed in' do
        post :create, :user => {}
        expect(subject.current_user).to eq(nil)
      end
    end
  end

  describe "PUT 'update'" do

    before(:each) do
      @user = { name: 'Name', surname: 'Surname', email:  'user@example.com',
                password: 'foobar01', password_confirmation: 'foobar01'}
    end

    context "With invalid parametrs" do

      it 'user have to be updated' do
        @attr = { name: 'Other', surname: 'Other', email:  'other@example.com',
                  password: 'otherpassword01', password_confirmation: 'otherpassword01' }
        put :update, :id => @user, :user => @attr
      end

    end
  end

end