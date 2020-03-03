Feature: create a new document

	As a collaborative coding initiator
	So that I can code with my teammates together
	I want to create a new file to edit

Background: Home page is successfully loaded

	GGiven I am on UltimateCode home page
	Then I should see button: "New"


Scenario: create a new document by clicking "New"
	When I press "New"
	Then I should see "//*[@id="textarea"]", "iframe", "//*[@id="langSelect"]"