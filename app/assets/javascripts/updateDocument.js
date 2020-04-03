$(document).ready(function(){
    //for editor
    var editor = ace.edit("editor");
    // set document textbox default value
    $('#docment_name_input').val($('#doc_name').val())
    //detect textarea change
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
    //detect select file change
    $('#selector5').on('change', function() {
        var selected = this.value;
        $.ajax({
            url: '/documents/change_doc',
            type: "GET",
            data: {'file_name' : selected},
            dataType: "text",
            success: function(data) {
                //alert('successfully');
                result = $.parseJSON(data);
                if (result.status.toString() == 'ok') {
                    $('#doc_name').val(selected)
                    $('#docment_name_input').val(selected)
                    ace.edit("editor").setValue(result.content.toString(), 1)
                    //alert(result.content.toString())
                } else {
                    alert(result.message.toString())
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(xhr.status);
                alert(thrownError);
            }
        });
    });
});

function updateDocName() {
  var new_name = $('#docment_name_input').val()
  var old_name = $('#doc_name').val()
  //alert(old_name)
  $.ajax({
        url: '/documents/edit_doc_name',
        type: "PUT",
        data: {'new_doc_name' : new_name, 'old_doc_name' : old_name},
        dataType: "text",
        success: function(data) {
            //alert('successfully');
            result = $.parseJSON(data);
            alert(result.message.toString())
            if (result.status.toString() == 'ok') {
                $('#doc_name').val(new_name)
                //alert($('#doc_name').val())
            } else {
                $('#docment_name_input').val(old_name)
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(xhr.status);
            alert(thrownError);
        }
    });
}
