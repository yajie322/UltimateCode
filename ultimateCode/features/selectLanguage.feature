Feature: select a programming language for the coding session

	As a code collaborator
	So that I can specify the programming language being used
	I want to have a drop-down list to choose a specific programming language

Background: a new document has been created

	Given I am on the UltimateCode edit page

Scenario: show all programming languages
	When I click "select"
	Then I should see "option"

Scenario: select a programming languages
	When I click "select"
	And I choose a programming language: "Ruby"
	Then I should see this programming language: "select", "Ruby"
