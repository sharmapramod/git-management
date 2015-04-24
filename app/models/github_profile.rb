class GithubProfile < ActiveRecord::Base
	belongs_to :user

	def self.create_github_profile(auth, new_user)
		info 		= auth.fetch("info")
		extra 		= auth.fetch("extra")
		raw_info 	= extra.fetch("raw_info")
		credentials = auth.fetch("credentials")

	    GithubProfile.create({ 	user_id: new_user.id, 
	    						nickname: info.nickname || "",
	      						email: info.email || "",
	      						name: info.name || "",
	      						image: info.image || "",
	      						location: raw_info.location || "",
	      						public_repo: raw_info.public_repos || "",
	      						public_gists: raw_info.public_gists || "",
	      						followers: raw_info.followers || "",
	      						following: raw_info.following || "",
	      						member_since: raw_info.created_at || "",
	      						access_token: credentials.token
	      					})
  	end

  	def self.update_github_profile(auth)
  		github_profile = GithubProfile.find_by_email(auth[:info][:email])  		
  		github_profile.nickname		=	auth[:info][:nickname]||""
  		github_profile.name 		=	auth[:info][:name]||""
  		github_profile.image 		= 	auth[:info][:image]||""
  		github_profile.location		=	auth[:extra][:raw_info][:location]||""
  		github_profile.public_repo 	=	auth[:extra][:raw_info][:public_repos]||""
  		github_profile.public_gists =	auth[:extra][:raw_info][:public_gists]||""	
  		github_profile.followers 	=	auth[:extra][:raw_info][:followers]||""
  		github_profile.following 	=	auth[:extra][:raw_info][:following]||""
  		github_profile.member_since =	auth[:extra][:raw_info][:created_at]||""
  		github_profile.access_token =	auth[:credentials][:token]  		
  		github_profile.save	   
  	end

end


