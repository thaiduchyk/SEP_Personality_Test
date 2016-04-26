class Api::V1::TestResultsController < ApplicationController
  include Docs::Api::V1::TestResultsController

  before_action :authenticate_user!

  def own_result
    OwnResultCounter.new(params, current_user.id).call
    render_own_result
  end

  def friend_result

  end

  private

  def render_own_result
    @personalities = User.own_result(current_user.id)
    render json: {
                 data: @personalities
           }
  end

end
