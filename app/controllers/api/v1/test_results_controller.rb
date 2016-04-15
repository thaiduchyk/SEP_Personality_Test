class Api::V1::TestResultsController < ApplicationController
  include Docs::Api::V1::TestResultsController

  before_action :authenticate_user!

  def own_result
    ResultCounter.new(params, current_user.id).call
    render_own_result
  end

  private

  def render_own_result
    @personalities = current_user.personalities
    render json: {
                 data: @personalities
           }
  end

end
