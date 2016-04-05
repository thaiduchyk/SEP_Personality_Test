require 'rails_helper'

RSpec.describe Api::V1::QuestionsController, type: :controller do

  before(:each) do
    binding.pry
    @questions = FactoryGirl.create(:question).as_json
    binding.pry
  end

  context 'Questions#index' do
     it 'returns all questions' do
       binding.pry
       get :index
       binding.pry
       expect(JSON.parse(response.body)['data']).to eq(@questions)
       binding.pry
      end
   # it 'responds with status 200' do
   #   get :index
   #   expect(response.status).to eq(200)
   # end
  end


end
