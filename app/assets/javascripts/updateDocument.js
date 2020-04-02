$(document).ready(function(){
    //for editor
    var editor = ace.edit("editor");
    $('#docment_name').val($('#doc_name').val())
    editor.session.on('change', function(){
        var url = "/documents/"+$('#doc_name').val();
        $.ajax({
            url: url,
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
function updateDocName() {
  alert('here!')
  /*$.ajax({
        url: url,
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
  });*/
}
