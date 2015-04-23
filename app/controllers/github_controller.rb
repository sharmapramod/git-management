class GithubController < ApplicationController
  def github_profile
  	#byebug
  	@user_profile = GithubProfile.find_by(user_id: current_user.id)
  end

  def github_repository
  	client = Octokit::Client.new(:access_token => current_user.github_profile.access_token)
    @repositories = client.repos
  end

  def new_invite
  	if params[:commit] =="Invite"
  		mail = params[:email].downcase
  		InvitationMailer.invitation_mail(mail, current_user.email).deliver
  	end
  end
end
