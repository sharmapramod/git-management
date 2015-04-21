class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :rememberable, :trackable, :validatable, :omniauthable
  	has_many :user_providers	
	has_one :github_profile
	def self.from_omniauth(auth)
	    where(email: auth.info.email).first_or_create do |user|
	      user.email = auth.info.email
	      user.password = Devise.friendly_token[0,20]
	    end
  	end
end
