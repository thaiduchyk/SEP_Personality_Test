require 'rails_helper'

RSpec.describe Users::RegistrationsController, :type => :controller do
  include Devise::TestHelpers

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end


  describe "POST 'create'" do

    context "With valid params" do
      before(:each) do
        @attr = { name: 'Name', surname: 'Surname', email:  'user@example.com',
                  password: 'foobar01', password_confirmation: 'foobar01' }
      end

      it 'creates user' do
        expect{post :create, :user => @attr}.to change(User, :count).by(1)
      end

      it 'signs in user' do
        post :create, :user => @attr
        expect(subject.current_user).to_not eq(nil)
      end
    end
  end

end