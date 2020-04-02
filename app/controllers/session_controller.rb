class SessionController < ApplicationController

def create
	@user = User.find_or_create_with_omniauth(request.env['omniauth.auth'])
	session[:user_id] = @user.id
	redirect_to root_path
end

def destroy
	session.delete(:user_id)
	flash[:notice] = ’Logged out successfully.’
	redirect_to root_path
	end
end
