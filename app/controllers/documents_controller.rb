class DocumentsController < ApplicationController

  def documents_params
    params.require(:document).permit(:name, :owner, :content)
  end

  def new
   #default: render index
    @question = "123"
    @programming_languages = [['Select Lang','c_cpp'], ['C','c_cpp'], ['C++','c_cpp'], ['CSS','css'], ['Go','golang'], ['HAML','haml'], ['HTML','html'], ['Java','java'], ['Javascript','javascript'], ['JSON','json'], ['MySql','mysql'], ['Python','python'], ['Ruby','ruby']]
    @theme = [['Select Theme','ambiance'], ['Ambiance','ambiance'], ['Chaos','chaos'], ['Dracula','dracula'], ['Cobalt','cobalt'], ['Terminal','terminal'], ['Twilight','twilight'], ['Monokai','monokai'], ['Chrome','chrome'], ['Dawn','dawn'], ['Github','github'], ['Xcode','xcode'],]
    @font_size = [['Font Size', 12], ['12', 12], ['14', 14], ['16', 16], ['18', 18], ['20', 20], ['40', 40], ['80', 80]]
  end

  def update
    #params['content'] to get content
    @question = "123"
    @programming_languages = [[params['content'],'C1'], ['C++1','C++1'], ['Ruby1','Ruby1']]
  end
end
