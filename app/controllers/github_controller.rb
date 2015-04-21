class GithubController < ApplicationController
  def github_profile
  	#byebug
  	@user_profile = GithubProfile.find_by(user_id: current_user.id)
  end

  def github_repository
  	client = Octokit::Client.new(:access_token => current_user.github_profile.access_token)
    @repositories = client.repos
  end
end
