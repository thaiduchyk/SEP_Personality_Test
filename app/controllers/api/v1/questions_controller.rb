class Api::V1::QuestionsController < ApplicationController

  def index
    render json: { data: Question.all.as_json }
  end

end
