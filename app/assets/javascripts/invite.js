window.onload = function () {
      // your code 
      var modal = document.getElementById("myModal");
      var span = document.getElementsByClassName("close")[0];
      document.getElementById("myTextarea").value = "for i in run";
      
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
      editor.setTheme("ace/theme/twilight");
      editor.session.setMode("ace/mode/python");

      
};


//hljs.initHighlightingOnLoad();
