$(document).ready(function(){
    //for editor
    var editor = ace.edit("MainContent");
    editor.setTheme("ace/theme/twilight");
    editor.session.setMode("ace/mode/python");
    editor.session.on('change', function(){
        //alert(editor.session.getValue())
        $.ajax({
            url: "/documents/id",
            type: "PUT",
            data: {"content" : editor.session.getValue()},
            dataType: "text",
            success: function(data, requestStatus, xhrObject) {
                //alert('successfully');
                //alert(data);
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(xhr.status);
                alert(thrownError);
            }
        });
    });
});
