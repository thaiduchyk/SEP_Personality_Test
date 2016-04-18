class Api::V1::InvitesController < ApplicationController
  include Docs::Api::V1::InvitesController

  before_action :authenticate_user!

  def create
    @invite = Invite.new(email: invite_params, user_id: current_user.id)
    if @invite.save
      InvitesMailer.invite_friend(@invite).deliver_now
      render_create_success
    else
      render_create_error
    end
  end

  private

  def invite_params
    params.require(:email)
  end

  def render_create_success
    render json: {
               status: 'success',
           }
  end

  def render_create_error
     render json: {
                 status: 'error',
                 data:   @invite.as_json,
                 errors: @invite.errors.to_hash.merge(full_messages: @invite.errors.full_messages)
             }, status: 403
  end

end
