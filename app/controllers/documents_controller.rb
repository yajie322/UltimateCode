class DocumentsController < ApplicationController
  protect_from_forgery with: :null_session
  def documents_params
    params.require(:document).permit(:name, :owner, :content)
  end

  def new
   #default: render index
    @programming_languages = [['Select Lang','c_cpp'], ['C','c_cpp'], ['C++','c_cpp'], ['CSS','css'], ['Go','golang'], ['HAML','haml'], ['HTML','html'], ['Java','java'], ['Javascript','javascript'], ['JSON','json'], ['MySql','mysql'], ['Python','python'], ['Ruby','ruby']]
    @theme = [['Select Theme','ambiance'], ['Ambiance','ambiance'], ['Chaos','chaos'], ['Dracula','dracula'], ['Cobalt','cobalt'], ['Terminal','terminal'], ['Twilight','twilight'], ['Monokai','monokai'], ['Chrome','chrome'], ['Dawn','dawn'], ['Github','github'], ['Xcode','xcode'],]
    @font_size = [['Font Size', 12], ['12', 12], ['14', 14], ['16', 16], ['18', 18], ['20', 20], ['40', 40], ['80', 80]]
    
    count = Document.where(user_id: params[:user_id]).size
    current_time = Time.now
    document = Document.new
    document.name = params[:user_id] + '_untitled_' + count.to_s
    document.user_id = params[:user_id].to_i
    document.content = ''
    document.created_at = current_time
    document.updated_at = current_time
    document.save
    @doc_name = params[:user_id] + '_untitled_' + count.to_s
    @document_list = []
    document = Document.where(user_id: params[:user_id])
    document.each do |doc|
        @document_list.append([doc.name, doc.name])
    end
  end

  def update
    #params['content'] to get content
    doc = Document.find_by(name: params[:id])
    if doc
        doc.update(content: params['content'], updated_at: Time.now)
        doc.save!
    end
    @programming_languages = [[doc.content, doc.content],[doc.updated_at, doc.updated_at]]
  end

  def edit_doc_name
    doc = Document.find_by(name: params['old_doc_name'])
    if doc
        if Document.find_by(name: params['new_doc_name'])
            respond_to do |format|
              msg = { :status => "err", :message => "file name exist!"}
              format.json { render json: msg }
            end
        else
            doc.update(name: params['new_doc_name'], updated_at: Time.now)
            doc.save!
            respond_to do |format|
              msg = { :status => "ok", :message => "Success"}
              format.json { render json: msg }
            end
        end
    end
  end
  def change_doc
    doc = Document.find_by(name: params['file_name'])
    if doc
        respond_to do |format|
            msg = { :status => "ok", :content => doc.content}
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
