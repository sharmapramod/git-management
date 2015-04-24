class UserProvider < ActiveRecord::Base
	belongs_to :user

	def self.find_with_omniauth(auth)
	    find_by(uid: auth['uid'], provider: auth['provider'])
	end

	def self.create_with_omniauth(auth, user)
		create(uid: auth['uid'], provider: auth['provider'], user: user).tap do 
			GithubProfile.create_github_profile(auth, user)
    	end    	
	end

	def self.update_with_omniauth(auth, user)
		create(uid: auth['uid'], provider: auth['provider'], user: user).tap do 
			GithubProfile.update_github_profile(auth, user)
    	end    	
	end	
end
