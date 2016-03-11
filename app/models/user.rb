class User < ActiveRecord::Base

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable :rememberable
  devise :database_authenticatable,:registerable,
         :recoverable, :omniauthable
  include DeviseTokenAuth::Concerns::User


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: {case_sensitive: false}

  VALID_PASSWORD_REGEX = /(?=.*\d)(?=.*[a-zA-Z])/
  validates :password, length: {minimum: 6},
             format: { with: VALID_PASSWORD_REGEX }

  VALID_NAME_REGEX = /\A[A-Z][a-zA-Z]{2,}\z/
  validates :name, presence:true,
            format: { with: VALID_NAME_REGEX }

  validates :surname, presence:true,
            format: { with: VALID_NAME_REGEX }
end
