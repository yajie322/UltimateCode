class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :get_document_list

  def authenticate
  	redirect_to :login unless logged_in?
  end

  def current_user
  	@current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
  	current_user != nil
  end

  def get_document_list
    @document_list = Hash.new
    if logged_in?
      user_id = session[:user_id]
      @document_list['Select files'] = ''
      owned_documents = Document.where(user_id: user_id).order(:id)
      owned_documents.each do |doc|
        @document_list[doc.name] = doc.id
      end

      collaborated_documents = Collaboration.where(user_id: user_id).order(:document_id)
      collaborated_documents.each do |c|
        doc = Document.find(c.document_id)
        if doc
          @document_list[doc.name] = doc.id
        end
      end
    end
    return @document_list
  end
end
