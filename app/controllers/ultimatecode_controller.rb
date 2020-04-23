class UltimatecodeController < ApplicationController
  def index
   #default: render index
    @document_list = []
    document = Document.where(user_id: session[:user_id]).order(:name)
    document.each do |doc|
        @document_list.append([doc.name, doc.id]) 
    end
  end
end
