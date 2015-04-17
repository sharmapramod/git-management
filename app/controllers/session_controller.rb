class SessionController < ApplicationController
	def destroy
		self.current_user = nil
	  	redirect_to root_url, notice: "Signed out!"
	end
end
