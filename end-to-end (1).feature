Feature: Test Approve Request

Background: Prepare Test Data
Given Create User "email@email.com" as User "User name"
And Assign User "User name" to be "Approver" for "Company1"
And Create Generic Workflow name "Test Approve Request"
And Create Generic Request Body
And Set default decision as "Approve"

TEST

Scenario: User can approve request without comment successfully
Given User create Rule name "Rule name"
And Set Rule "rule name" send approve request to "User name" if "Key name" more than "value"
And User supply "Key name" with value "value" for approve request
And Send request to approval
When User Approve Request
Then Request is approved successfully


Scenario: User can approve request with comment successfully
Given User create Rule name "Rule name"
And Set Rule "rule name" send approve request to "User name" if "Key name" more than "value"
And User supply "Key name" with value "value" for approve request
And Send request to approval
When User Approve Request with comment "comment"
Then Request is approved successfully
And Comment is saved in database as "comment" correctly


Scenario: Request can be approve by default succesfully
Given User create Rule name "Rule name"
And User supply "Key name" with value "value" for approve request
When Send request to approval
Then Request is approved successfully
