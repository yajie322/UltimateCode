Feature: create a new document

	As a collaborative coding initiator
	So that I can code with my teammates together
	I want to create a new file to edit

Background: Home page is successfully loaded

	Given I am on the UltimateCode home page
	Then I should see button: "New"

Scenario: create a new document by clicking "New"
	When I press "New"
	Then I should be on the UltimateCode edit page
	And I should see "textarea", "iframe", "select"

