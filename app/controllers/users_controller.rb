class UsersController < ApplicationController


  def new
  	@user = User.new
  end


  def create
  	@user = User.new(user_params)

  	if @user.save
  		flash[:success] = "You've successfully signed up!"

  		# tell the browser using a cookie that i am this user
  		session[:user_id] = @user.user_id
  		
  		redirect_to root_path
  	else
  		render :new
  	end
  end


  # whitelist the users input from the form
  # stop dem hackers
  def user_params
  	params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end


end
