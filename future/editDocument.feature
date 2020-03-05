Feature: edit the document 

	As a code collaborator
	So that I can modify the document
	I want to change the content shown in the textarea

Background: a new document has been created

	Given I am on the UltimateCode edit page

Scenario: edit the document
	When I type "Hello, world!"
	Then the "the_input" field should contain "Hello, world!"
