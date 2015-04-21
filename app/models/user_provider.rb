class UserProvider < ActiveRecord::Base
	belongs_to :user

	def self.find_with_omniauth(auth)
	    find_by(uid: auth['uid'], provider: auth['provider'])
	end

	def self.create_with_omniauth(auth, user)
		new_user = create(uid: auth['uid'], provider: auth['provider'], user: user)
		GithubProfile.create_github_profile(auth, user)
    	new_user
	end

	
end
