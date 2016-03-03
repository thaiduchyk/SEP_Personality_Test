require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.new(name:'Test', surname:'Test', email:'test@gmail.com',
                         password: 'foobar5', password_confirmation: 'foobar')
  end

  describe 'validations' do

  end
  it 'email format is correct' do
    expect(@user).to be_valid
  end

  it 'email format is not correct' do
    ['mittlag@test.com123', 'mittlag@cl_admin.com', 'mittlag', 'mittlag@cd.234'].each do |email|
      @user.email = email
      expect(@user).to_not be_valid
    end
  end

  it 'email is present' do
    expect(@user).to be_valid
  end

  it 'email is blank' do
    @user.email = ''
    expect(@user).to_not be_valid
  end

  it 'should have a unique email' do
    @user.save!
    user = User.new(email:'test@gmail.com')
    expect(user).to_not be_valid
  end

  it 'password is with correct length (6)' do
    @user.password = 'a4' * 3
    expect(@user).to be_valid
  end

  it 'password is with incorrect length (< 6)' do
    @user.password = 'a' * 5
    expect(@user).to_not be_valid
  end

  it 'password format is correct' do
    @user.password = '2d2d4d'
    expect(@user).to be_valid
  end

  it 'password format is not correct' do
    ['111111', 'aaaaaa'].each do |password|
      @user.password = password
      expect(@user).to_not be_valid
    end
  end

  it 'password is present' do
    expect(@user).to be_valid
  end

  it 'password is blank' do
    @user.password = ''
    expect(@user).to_not be_valid
  end

  it 'name format is correct' do
    expect(@user).to be_valid
  end

  it 'name format is not correct' do
    ['A', 'A1', 'Test5', 'testname'].each do |name|
      @user.name = name
      expect(@user).to_not be_valid
    end
  end
end
