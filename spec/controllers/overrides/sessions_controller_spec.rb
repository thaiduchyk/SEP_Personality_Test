require 'rails_helper'

RSpec.describe Overrides::SessionsController, type: :controller do
  include Devise::TestHelpers
  before(:each) do
    @user = FactoryGirl.create(:user)
  end
end