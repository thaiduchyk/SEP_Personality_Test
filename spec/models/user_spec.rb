require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.new(name:'Test', surname:'Test', email:'test@gmail.com',
                         password: 'foobar5', password_confirmation: 'foobar')
  end

  describe 'validations' do

    context 'with valid parameters' do

      it 'is valid' do
        expect(@user).to be_valid
      end

    end

    context 'with invalid parameters' do

      it 'is invalid then email format is not correct' do
        ['mittlag@test.com123', 'mittlag@cl_admin.com', 'mittlag', 'mittlag@cd.234'].each do |email|
          @user.email = email
          expect(@user).to_not be_valid
        end
      end

      it 'is invalid then email is blank' do
        @user.email = ''
        expect(@user).to_not be_valid
      end

      it 'is invalid then email is not unique' do
        @user.save!
        user = User.new(email:'test@gmail.com')
        expect(user).to_not be_valid
      end

      it 'is invalid then password is too short' do
        @user.password = '1' + 'a' * 4
        expect(@user).to_not be_valid
      end

      it 'is invalid then password format is not correct' do
        ['111111', 'aaaaaa'].each do |password|
          @user.password = password
          expect(@user).to_not be_valid
        end
      end

      it 'is invalid then password password is blank' do
        @user.password = ''
        expect(@user).to_not be_valid
      end

      it 'is invalid then name format is not correct' do
        ['A', 'A1', 'Test5', 'testname'].each do |name|
          @user.name = name
          expect(@user).to_not be_valid
        end
      end

      it 'is invalid then name is blank' do
        @user.name = ''
        expect(@user).to_not be_valid
      end

      it 'is invalid then surname format is not correct' do
        ['A', 'A1', 'Test5', 'testname'].each do |surname|
          @user.surname = surname
          expect(@user).to_not be_valid
        end
      end

      it 'is invalid then surname is blank' do
        @user.surname = ''
        expect(@user).to_not be_valid
      end

    end

  end














end
