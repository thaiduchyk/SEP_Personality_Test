module Docs::Api::V1::Auth
  module RegistrationsController
    extend ActiveSupport::Concern

    included do
      swagger_controller :registrations, "User form registration"

      swagger_api :create do
        summary "Creates new user"
        param :form, :name, :string, :required, "Name"
        param :form, :surname, :string, :required, "Surname"
        param :form, :email, :string, :required, "Email"
        param :form, :password, :string, :required, "Password"
        param :form, :password_confirmation, :string, :required, "Password confirmation"
        response :forbidden
      end
    end
  end
end