class UltimatecodeController < ApplicationController
  def index
   #default: render index
    @document_list = [[' Select File', '' ,:style => 'font-size:10px;']]
    document = Document.where(user_id: session[:user_id]).order(:name)
    document.each do |doc|
        @document_list.append([doc.name, doc.id, :style => 'font-size:10px;']) 
    end
  end
end

