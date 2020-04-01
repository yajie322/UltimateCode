class DocumentsController < ApplicationController

  def documents_params
    params.require(:document).permit(:name, :owner, :content)
  end

  def new
   #default: render index
    @question = "123"
    @programming_languages = [['C','C'], ['C++','C++'], ['Ruby','Ruby'], ['Python','Python']]
  end
end
