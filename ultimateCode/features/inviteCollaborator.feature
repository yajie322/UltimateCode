Feature: invite a collaborator to edit document together

	As a team member
	So that I can add another teammate to the coding session
	I want to get a link through which my teammate can join the coding session

Background: a new document has been created

	Given the editor interface is shown

Scenario: get the invitation hyperlink
	When I click "invite"
	Then I should see a link: "input"