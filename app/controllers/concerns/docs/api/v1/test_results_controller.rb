module Docs::Api::V1
  module TestResultsController
    extend ActiveSupport::Concern

    included do
      swagger_controller :test_results, "Calculating test results"

      swagger_api :own_result do
        summary "Calculates user result"
        param :body, :result, :string, :required, "Questions result"
        param :header, :uid, :string, :required, "uid"
        param :header, :client, :string, :required, "client"
        param :header, 'access-token', :string, :required, "token"
        response :unauthorized
      end

    end
  end
end

