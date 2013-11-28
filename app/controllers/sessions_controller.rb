class SessionsController < ApplicationController


  def new
  	# this doesn't need a variable because it's a placeholder form
  end


  def create
  	# instructions
  	# find the username and password from the form
  	# then check if there's a user with that username
  	# AND if they have the same password as what was typed in
  	# THEN give them a session
  	
  	@username = params[:session][:username]
  	@password = params[:session][:password]

  	@user = User.find_by_username(@username)

  	# if the username matches with user and password
  	if @user.present? and @user.authenticate(@password)
  		# give them a session
  		session[:user_id] = @user.id
  		flash[:success] = "You've logged in successfully"
  		redirect_to root_path
  	else
  		flash[:error] = "Log in failed"
  		render :new
  	end

  end


  # remove session[:user_id] when logging out
  def destroy
  	reset_session
  	flash[:session] = "You've logged out"
  	redirect_to root_path
  end

end
