Feature: edit the document 

	As a code collaborator
	So that I can modify the document
	I want to change the content shown in the textarea

Background: a new document has been created

	Given the editor interface is shown

Scenario: edit the document
	When I type something: "Hello, world!"
	Then I should see what I typed in the textarea: "Hello, world!"