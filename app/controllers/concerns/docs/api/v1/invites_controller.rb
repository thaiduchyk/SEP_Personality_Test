module Docs::Api::V1
  module InvitesController
    extend ActiveSupport::Concern

    included do
      swagger_controller :invites, "Invites"

      swagger_api :create do
        summary "Creates new invite and sends email to friend"
        param :body, :email, :string, :required, "email to send invite"
        param :header, :uid, :string, :required, "uid"
        param :header, :client, :string, :required, "client"
        param :header, 'access-token', :string, :required, "token"
        response :unauthorized
      end

      swagger_api :check_invite do
        summary "Checks if invite was sent to email and if token is valid"
        param :body, :params, :string, :required, "email and token"
        response :unauthorized
      end


    end
  end
end