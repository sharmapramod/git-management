class GithubProfile < ActiveRecord::Base
	belongs_to :user
	def self.create_github_profile(auth, new_user)
	    GithubProfile.create({user_id: new_user.id, nickname: auth[:info][:nickname]||"",
	      email: auth[:info][:email]||"", name: auth[:info][:name]||"",
	      image: auth[:info][:image]||"",
	      location: auth[:extra][:raw_info][:location]||"",
	      public_repo: auth[:extra][:raw_info][:public_repos]||"",
	      public_gists: auth[:extra][:raw_info][:public_gists]||"",
	      followers: auth[:extra][:raw_info][:followers]||"",
	      following: auth[:extra][:raw_info][:following]||"",
	      member_since: auth[:extra][:raw_info][:created_at]||"",
	      access_token: auth[:credentials][:token]})
  end
end
