class DocumentsController < ApplicationController
  protect_from_forgery with: :null_session

  
  def documents_params
    params.require(:document).permit(:name, :owner, :content)

  end

  def index
    @programming_languages = [['Select Lang','c_cpp'], ['C','c_cpp'], ['C++','c_cpp'], ['CSS','css'], ['Go','golang'], ['HAML','haml'], ['HTML','html'], ['Java','java'], ['Javascript','javascript'], ['JSON','json'], ['MySql','mysql'], ['Python','python'], ['Ruby','ruby']]
    @theme = [['Select Theme','ambiance'], ['Ambiance','ambiance'], ['Chaos','chaos'], ['Dracula','dracula'], ['Cobalt','cobalt'], ['Terminal','terminal'], ['Twilight','twilight'], ['Monokai','monokai'], ['Chrome','chrome'], ['Dawn','dawn'], ['Github','github'], ['Xcode','xcode'],]
    @font_size = [['Font Size', 12], ['12', 12], ['14', 14], ['16', 16], ['18', 18], ['20', 20], ['40', 40], ['80', 80]]

    if session[:current_document_id]
      @current_document = Document.find(session[:current_document_id])
    else
      # Get the last document
      @current_document = Document.limit(1).order("id desc")
    end

    @current_document_name = @current_document.name
    @document_list = Hash.new
    owned_documents = Document.where(user_id: session[:user_id])
    owned_documents.each do |doc|
        @document_list[doc.name] = doc.id
    end

    collaborated_documents = Collaboration.where(user_id: session[:user_id])
    collaborated_documents.each do |c|
      puts c.user_id
      doc = Document.find(c.document_id)
      if doc
        @document_list[doc.name] = doc.id
      end
    end
  end

  def new
    #default: render index
    user_id = session[:user_id]
    count = Document.where(user_id: user_id).size
    current_time = Time.now
    document = Document.create!(:name => user_id.to_s + '_untitled_' + count.to_s,
      :user_id => user_id,
      :content => "",
      :created_at => current_time,
      :updated_at => current_time)
    session[:current_document_id] = document.id
    redirect_to documents_path
  end

  def show
    document ||= Document.find(params[:id])
    if document
      respond_to do |format|
        content = document.content
        if !content
          content = ""
        end
        msg = { :content => content }
        format.json { render json: msg }
      end
    end
  end

  def update
    #params['content'] to get content
    document ||= Document.find(params[:id])
    if document
      document.update(content: params['content'], updated_at: Time.now)
      document.save!
    end
    respond_to do |format|
      format.json { head :ok }
    end
  end

  def edit_doc_name
    current_document_id = session[:current_document_id]
    if !current_document_id
      respond_to do |format|
        msg = { :status => "err", :message => "Current Document ID missing."}
        format.json { render json: msg }
      end
      return
    end

    document = Document.find(current_document_id)
    if document
      document_with_same_name = Document.find_by(name: params['new_doc_name'])
        if document_with_same_name && document_with_same_name.id != current_document_id
          respond_to do |format|
            msg = { :status => "err", :message => "There is an existing file with the same name."}
            format.json { render json: msg }
          end
        else
            document.update(name: params['new_doc_name'], updated_at: Time.now)
            document.save!
            respond_to do |format|
              msg = { :status => "ok", :message => "Success."}
              format.json { render json: msg }
            end
        end
    end
  end

  def add_collaborator
    user = User.find_by_email(params[:email])
    document ||= Document.find(params[:id])
    if user
      document.collaborations.create!(:user_id => user.id)
    end
    respond_to do |format|
      format.json { head :ok }
    end
  end

  def change_doc
    doc = Document.find_by(name: params['file_name'])
    if doc
      session[:current_document_id] = doc.id
        respond_to do |format|
            content = doc.content
            if !content
              content = ""
            end
            msg = { :status => "ok", :content => content }
            format.json { render json: msg }
        end
    else
        respond_to do |format|
            msg = { :status => "err", :message => "file not exist!"}
            format.json { render json: msg }
        end
    end
  end

end
