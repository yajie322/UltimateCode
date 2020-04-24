class SessionsController < ApplicationController
	def create
		@user = User.find_or_create_with_omniauth(request.env['omniauth.auth'])
		session[:user_id] = @user.id
		@document_list = [['Select File', '']]
    		document = Document.where(user_id: session[:user_id]).order(:name)
    		document.each do |doc|
        		@document_list.append([doc.name, doc.id])
		end
		redirect_to root_path
	end

	def destroy
		session.delete(:user_id)
		flash[:notice] = 'Logged out successfully.'
		redirect_to root_path
	end
end
