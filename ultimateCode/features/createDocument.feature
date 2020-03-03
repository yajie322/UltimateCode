Feature: create a new document

	As a collaborative coding initiator
	So that I can code with my teammates together
	I want to create a new file to edit

Background: Home page is successfully loaded

	Given I am on the UltimateCode home page
	Then I should see a "New" button: "New", "button"


Scenario: create a new document by clicking "New"
	When I press "New"
	Then I should see editor interface: "textarea", "iframe", "select"