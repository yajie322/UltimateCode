var InvitePopup = {
	setup: function() {
		$(document).on(`click`, `#invite`, InvitePopup.showInvitePopup);
		$(document).on(`click`, `#closeModalBtn`, InvitePopup.hideInvitePopup);
		$(document).on(`click`, `#collaboratorAddBtn`, InvitePopup.addCollaborator);
	},
	addCollaborator: function() {
		postfix = '/add_collaborator/' + $('#collaborator_email').val();
		$.ajax({
			type: 'GET',
			url: $(location).attr('href') + postfix,
			timeout: 5000,
			success: function() {
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