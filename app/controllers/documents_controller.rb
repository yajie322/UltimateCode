class DocumentsController < ApplicationController

  def documents_params
    params.require(:document).permit(:name, :owner, :content)
  end

  def new
   #default: render index
    @question = "123"
    @programming_languages = [['C','C'], ['C++','C++'], ['Ruby','Ruby']]
  end

  def update
    #params['content'] to get content
    @question = "123"
    @programming_languages = [[params['content'],'C1'], ['C++1','C++1'], ['Ruby1','Ruby1']]
  end
end
