Feature: edit the document 

	As a code collaborator
	So that I can modify the document
	I want to change the content shown in the textarea

Background: a new document has been created

	Given I am on UltimateCode edit page

Scenario: edit the document
	When I type "Hello, world!"
	Then I should see "Hello, world!" in the "textarea"
