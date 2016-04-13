class InvitesMailer < ApplicationMailer

  def invite_friend(invite)
    @invite = invite
    @url  = "http://example.com/start?email=#{@invite.email}?token=#{@invite.token}?user=#{@invite.user_id}"
    mail(to: @invite.email, subject: 'Welcome to pass the test')
  end

end
