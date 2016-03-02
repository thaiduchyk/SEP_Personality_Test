class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable :rememberable and :omniauthable
  devise :database_authenticatable,:registerable,
         :recoverable,:trackable
end
