class SocialLoginsController < ApplicationController

	def create

		# this is all the info back from facebook/twitter/linkedin
		@omniauth = request.env['omniauth.auth']

		# just following how omniauth works
		@email = @omniauth["info"]["email"]
		@user.name = @omniauth["info"]["name"]
		@provider = @omniauth["provder"]
		@provider_id = @omniauth["uid"]

		@user = User.find_by_email(@email)

		if @user.present?
			# they're already in the system
			flash[:success] = "Logged in successfully"
		else
			# add a new user
			@user = User.new
			@user.email = @email
			@user.name = @name

			@user.facebook_id = @provider_id if @provider == "facebook"
			@user.twitter_id = @provider_id if @provider == "twitter"
			@user.linkedin_id = @provider_id if @provider == "linkedin"

			@user.save

			flash[:success] = "Signed up successfully"

		end

	end

end
