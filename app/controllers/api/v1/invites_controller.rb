class InvitesController < ApplicationController
  include Docs::Api::V1::InvitesController

  before_action :authenticate_user!

  def create
    @invite = Invite.new(email: params, user_id: current_user.id)
    if @invite.save
      InvitesMailer.invite_friend(@invite).deliver
    else
      render_create_error
    end
  end

  private

  def render_create_error
     render json: {
                 status: 'error',
                 data:   @invite.as_json,
                 errors: @resource.errors.to_hash.merge(full_messages: @resource.errors.full_messages)
             }, status: 403
  end

end
