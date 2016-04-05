class Api::V1::QuestionsController < ApplicationController

  def index
    binding.pry
    render json: { data: Question.all.as_json }
    binding.pry
  end
end
