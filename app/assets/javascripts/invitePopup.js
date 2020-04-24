var InvitePopup = {
	setup: function() {
		$(document).on(`click`, `#invite`, InvitePopup.showInvitePopup);
		$(document).on(`click`, `#closeModalBtn`, InvitePopup.hideInvitePopup);
		$(document).on(`click`, `#collaboratorAddBtn`, InvitePopup.addCollaborator);
	},
	addCollaborator: function() {
		currentDocumentId = $("#current-document-selector option:selected").val();
		collaboratorEmail = $('#collaborator_email').val();
		postfix = '/' + currentDocumentId + '/add_collaborator';
		$.ajax({
			type: 'GET',
			url: $(location).attr('href') + postfix,
			timeout: 5000,
			data: { 'email': collaboratorEmail },
			dataType: 'text',
			success: function(data) {
				InvitePopup.hideInvitePopup();
				alert(`Success!`);
			},
			error: function(xhrObj, textStatus, exception) {
				alert(`Error!`);
			}
		});
		return(false);
	},
	showInvitePopup: function() {
		$(`#inviteModal`).css({'display': "block"});
	},
	hideInvitePopup: function() {
		$(`#inviteModal`).css({'display': ""});
	}
};
$(InvitePopup.setup);