class Api::V1::InvitesController < ApplicationController
  include Docs::Api::V1::InvitesController

  before_action :authenticate_user!, :only => [:create]

  def create
    @invite = Invite.new(email: invite_params, user_id: current_user.id)
    if @invite.save
      InvitesMailer.invite_friend(@invite).deliver_now
      render_create_success
    else
      render_create_error
    end
  end

  def check_invite

    @check_invite = Invite.find_by_email(check_params[:email])
    token = check_params[:token]

    if @check_invite && @check_invite.token=token && @check_invite.passed=false
      render_check_success
    elsif @check_invite && @check_invite.token=token && @check_invite.passed=true
      render_check_error_already_passed
    elsif @check_invite && !@check_invite.token=token
      render_check_error_token_not_valid
    else
      render_check_error_not_found
    end

  end

  private

  def invite_params
    params.require(:email)
  end

  def check_params
    params.permit(:email, :token)
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

  def render_check_success
    render json: {
               status: 'success',
               data: Personality.all.as_json,
               user: User.find(@check_invite.user_id).as_json
           }
  end

  def  render_check_error_already_passed
    render json: {
               status: 'error',
               data:   @check_invite.as_json,
               errors: 'already passed'
           }, status: 403
  end

  def render_check_error_token_not_valid
    render json: {
               status: 'error',
               data:   @check_invite.as_json,
               errors: 'token not valid'
           }, status: 403
  end

  def render_check_error_not_found
    render json: {
               status: 'error',
               data:   @check_invite.as_json,
               errors: 'email not found'
           }, status: 403
  end

end
