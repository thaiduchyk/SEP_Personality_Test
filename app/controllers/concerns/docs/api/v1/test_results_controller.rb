module Docs::Api::V1
  module TestResultsController
    extend ActiveSupport::Concern

    included do
      swagger_controller :test_results, "Calculating test results"

      swagger_api :own_results do
        summary "Calculates user result"
        param :body, :results, :string, :required, "Friend's email"
        param :header, :uid, :string, :required, "uid"
        param :header, :client, :string, :required, "client"
        param :header, 'access-token', :string, :required, "token"
        response :unauthorized
      end

    end
  end
end

