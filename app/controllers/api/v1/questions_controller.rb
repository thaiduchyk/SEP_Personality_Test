class Api::V1::QuestionsController < ApplicationController


  def index
    # binding.pry
    render json: { data: Question.all.as_json }
  end

  def create
    question = Question.new question_params
    if question.save
      render json: question, status: 201
    else
        render json: question.errors, status: 422
    end

  end

  def question_params
    params.require(:question).permit(:qst_txt, :a, :b)
  end

end
