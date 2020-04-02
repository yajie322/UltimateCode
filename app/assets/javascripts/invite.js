ace.require("ace/ext/language_tools");
var bool_gutter = true
window.onload = function () {
      // your code 
      var modal = document.getElementById("myModal");
      var span = document.getElementsByClassName("close")[0];
      //document.getElementById("myTextarea").value = "for i in run";
      
      document.getElementById("myBtn").onclick = function () {
            modal.style.display = "block";
      }   
      span.onclick = function () {
            modal.style.display = "none";
      }     
      window.onclick = function (event) {
            if (event.target == modal) {
                  modal.style.display = "none";
            }
      }
      
      
      var editor = ace.edit("editor");
      editor.setTheme("ace/theme/ambiance");    
      editor.session.setMode("ace/mode/c_cpp");
      //editor.setOption("showLineNumbers", false);
      //editor.setOption("highlightActiveLine", false)
      
      document.getElementById('editor').onclick = function () {
            var sel_lang = document.getElementById('selector3').value
            var sel_theme = document.getElementById('selector2').value
            var font_num = document.getElementById('selector4').value
            console.log("dd");
            
            console.log(parseInt(font_num));
            font_num = parseInt(font_num)
            var str1 = "ace/mode/"
            var str2 = "ace/theme/"
            var mode = str1.concat(sel_lang);
            var theme = str2.concat(sel_theme);
            editor.session.setMode(mode);
            editor.setTheme(theme);
            
            
            editor.setOptions({
                  fontSize: font_num
            })
            
      }
      
      document.getElementById('switch').onclick = function () {
            bool_gutter = !bool_gutter
            console.log(bool_gutter)
            editor.renderer.setShowGutter(bool_gutter)
      }
      

      
      
};


//hljs.initHighlightingOnLoad();
