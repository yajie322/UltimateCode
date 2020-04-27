$(document).ready(function(){
    // set document textbox default value
    var currentDocumentName = $('#current-document-selector option:selected').text();
    var currentDocumentId = $('#current-document-selector option:selected').val();
    $('#document_name_input').val(currentDocumentName)

    ace.edit('editor').session.on('change', updateDocumentContent)

    //detect select file change
    $('#current-document-selector').on('change', function() {
        var selected = $('#current-document-selector option:selected').text()
        $.ajax({
            url: '/documents/change_doc',
            type: "GET",
            data: {'file_name' : selected},
            dataType: "text",
            success: function(data) {
                result = $.parseJSON(data);
                if (result.status.toString() == 'ok') {
                    $('#document_name_input').val(selected)
                    ace.edit("editor").setValue(result.content.toString(), 1)
                    console.log(result.content.toString())
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
    //delete file
    $('#delete').on('click', function() {
        url = $(location).attr('href').replace('/documents', '');
        var selected = $('#current-document-selector option:selected').text()
        var check = confirm('Delete ' + selected + '?');
        if (check){
		$.ajax({
		    url: $(location).attr('href') + '/delete_doc',
		    type: "PUT",
		    dataType: "text",
		    success: function(data) {
		        result = $.parseJSON(data);
		        if (result.status.toString() == 'ok') {
		            alert(result.file_name.toString() + ' deleted');
		            window.location.assign(url);                     
		        } else {
		            alert(result.message.toString())
		        }
		    },
		    error: function(xhr, ajaxOptions, thrownError) {
		        alert(xhr.status);
		        alert(thrownError);
		    }
		});
	}
    });
});

function updateDocumentContent() {
    currentDocumentId = $('#current-document-selector option:selected').val();
    $.ajax({
        url: $(location).attr('href') + '/' + currentDocumentId,
        type: "PUT",
        data: {"content" : ace.edit('editor').session.getValue()},
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
}

function updateDocumentName() {
  var new_name = $('#document_name_input').val()
  // var old_name = $('#current_document_name').val()
  var old_name = $('#current-document-selector option:selected').text();

  $.ajax({
        url: $(location).attr('href') + '/edit_doc_name',
        type: "PUT",
        data: {'new_doc_name' : new_name},
        dataType: "text",
        success: function(data) {
            result = $.parseJSON(data);
            if (result.status.toString() == 'ok') {
                $('#document_name_input').val(new_name)
                $('#current-document-selector option:selected').text(new_name);
            } else {
                $('#document_name_input').val(old_name)
                alert(result.message)
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(xhr.status);
            alert(thrownError);
        }
    });
}
