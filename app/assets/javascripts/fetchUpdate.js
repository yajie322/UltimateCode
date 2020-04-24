$(document).ready(function() {
	fetchUpdate()
	setInterval(fetchUpdate, 1000);
});

function fetchUpdate() {
	currentDocumentId = $("#current-document-selector option:selected").val();
	$.ajax({
		type: "GET",
		url: $(location).attr('href') + '/' + currentDocumentId,
		dataType: 'text',
		success: function(data) {
			result = $.parseJSON(data);
			ace.edit("editor").setValue(result.content.toString(), 1)
		}
	});
}