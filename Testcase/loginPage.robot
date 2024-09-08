*** Settings ***
Library         AppiumLibrary
Resource        ../Variabled/variabled.robot
Resource        ../Keyword/commond_keyword.robot

Test Setup       Run keywords
...              Open application Swag Lab

Test Teardown    Run Keywords
...              Close Application


*** Test Cases ***

Scenario: Open application and Login with autofill
    Tab username "standard_user" to autofill
    Click Login button
    Display swag lab page
    Capture Page Screenshot

Scenario: Login without require field
    Click Login button
    Display error message "Username is required"

Scenario: Login with invalid password
    Fill in username field with "standard_user"
    Fill in password field with "test1234"
    Click Login button
    Display error message "Username and password do not match any user in this service."



