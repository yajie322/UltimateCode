ace.require("ace/ext/language_tools");
var bool_gutter = true
window.onload = function () {
      var editor = ace.edit("editor");

      editor.setTheme("ace/theme/ambiance");
      editor.session.setMode("ace/mode/c_cpp");

      //editor.setOption("showLineNumbers", false);
      //editor.setOption("highlightActiveLine", false)
      console.log(document.getElementsByTagName("select"))
      const allSelects = document.getElementsByTagName("select");
      const allSelectsArray = [...allSelects];
      editor.setOptions({
            enableBasicAutocompletion: true,
            enableSnippets: true,
            enableLiveAutocompletion: true
      })


      allSelectsArray.map((select) => {
            select.onchange = function () {

                  var sel_lang = document.getElementById('selector3').value
                  var sel_theme = document.getElementById('selector2').value
                  var font_num = document.getElementById('selector4').value

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
      });

      document.getElementById('switch').onclick = function () {
            bool_gutter = !bool_gutter
            console.log(bool_gutter)
            editor.setOption('showLineNumbers', bool_gutter);
            //editor.renderer.setShowGutter(bool_gutter)
      }
};


//hljs.initHighlightingOnLoad();