class InvitesController < ApplicationController

  before_action :authenticate_user!

  def create
    @invite = Invite.new(email: params, user_id: current_user.id)
    if @invite.save
      InvitesMailer.invite_friend(@invite).deliver
    else
      if
    end
  end

  private


end
