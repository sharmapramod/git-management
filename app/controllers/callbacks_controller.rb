class CallbacksController < Devise::OmniauthCallbacksController
  	def github
	  	auth = request.env['omniauth.auth']
	    #sign_in_and_redirect @user
	    # Find an identity here
	    #reset_session
	    #byebug
	  	@identity = UserProvider.find_with_omniauth(auth)
		if @identity.nil?
			# If no identity was found, create a brand new one here
			user= User.from_omniauth(auth)
			@identity = UserProvider.create_with_omniauth(auth, user)		
		end
		#byebug
		puts "Pass over user step1"
		if signed_in?
			puts "Pass over user step2"
			if @identity.user == current_user
				# User is signed in so they are trying to link an identity with their
				# account. But we found the identity and the user associated with it 
				# is the current user. So the identity is already associated with 
				# this user. So let's display an error message.
				redirect_to root_url, notice: "Already linked that account!"
			else
				# The identity is not associated with the current_user so lets 
				# associate the identity
				@identity.user = current_user
				@identity.save()
				sign_in_and_redirect user, notice: "Successfully linked that account!"
			end
		else
			puts "Pass over user step3"
			if @identity.user.present?
				puts "Pass over user step31"
				# The identity we found had a user associated with it so let's 
				# just log them in here
				self.current_user = @identity.user
				sign_in_and_redirect @identity.user, notice: "Signed in!"
				#redirect_to root_url, notice: "Signed in!"
			else
				puts "Pass over user step32"
				# No user associated with the identity so we need to create a new one
				redirect_to new_user_session_path, notice: "Please finish registering"
			end
		end
  	end
end
