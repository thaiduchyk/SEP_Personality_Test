class InvitesMailer < ApplicationMailer

  def invite_friend(invite)
    @invite = invite
    @user = User.find(@invite.user_id)
    @url  = "http://example.com/start?email=#{@invite.email}?token=#{@invite.token}"
    mail(to: @invite.email, subject: 'Welcome to pass the test')
  end

end
