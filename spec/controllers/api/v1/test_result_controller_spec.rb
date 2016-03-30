require 'rails_helper'

RSpec.describe TestResultController, type: :controller do

  describe "GET #count" do
    it "returns http success" do
      get :count
      expect(response).to have_http_status(:success)
    end
  end

end
