class Api::V1::QuestionsController < ApplicationController
  def show
    binding.pry
    @questions = Question.all
    binding.pry
  end
end
