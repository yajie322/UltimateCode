$(document).ready(function(){
    $('#MainContent').bind('input propertychange', function() {
        $.ajax({
            url: "/documents/id",
            type: "PUT",
            data: {"content" : $(this).text()},
            dataType: "text",
            success: function(data, requestStatus, xhrObject) {
                alert('successfully');
                alert(data);
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(xhr.status);
                alert(thrownError);
            }
        });
    });
});
