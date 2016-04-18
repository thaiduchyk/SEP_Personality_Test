require 'rails_helper'

RSpec.describe Invite, type: :model do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @invite = FactoryGirl.create(:invite)
    @invite.user = @user
  end

  describe 'validations' do

    context 'with valid parameters' do

      it 'is valid' do
        expect(@invite).to be_valid
      end

    end

    context 'with invalid parameters' do

      it 'is invalid when email is blank' do
        @invite.email = ''
        expect(@invite).to_not be_valid
      end

      it 'is invalid when email is not unique' do
        invite = Invite.new(email: @invite.email.upcase)
        expect(invite).to_not be_valid
      end

      it 'is invalid then email format is not correct' do
        ['mittlag@test.com123', 'mittlag@cl_admin.com', 'mittlag', 'mittlag@cd.234'].each do |email|
          @invite.email = email
          expect(@invite).to_not be_valid
        end
      end

    end
  end
end
