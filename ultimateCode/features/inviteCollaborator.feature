Feature: invite a collaborator to edit document together

	As a team member
	So that I can add another teammate to the coding session
	I want to get a link through which my teammate can join the coding session

Background: a new document has been created

	Given I am on UltimateCode edit page

Scenario: get the invitation hyperlink
	When I press "invite"
	Then I should see "input"
