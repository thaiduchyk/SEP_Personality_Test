class Invite < ActiveRecord::Base
  belongs_to :user

  before_create :generate_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: {case_sensitive: false}


  private

  def generate_token
    self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end




end
