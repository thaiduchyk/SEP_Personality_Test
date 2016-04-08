module Docs::Api::V1
  module TestResultsController
    extend ActiveSupport::Concern

    included do
      swagger_controller :test_results, "Calculating test results"

      swagger_api :own_result do
        summary "Calculates user result"
        param :body, :result, :string, :required, "Questions result"
        response :unauthorized
      end

    end
  end
end

