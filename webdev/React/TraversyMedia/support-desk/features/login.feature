Feature: Login
  As a registered user
  I want to log in to my account
  So that I can access my personalized content

Rule: correct credentials are entered

    Scenario: Bob wants to login
        Given Bob opens support-desk website
        And goes to loginpage
        When he has entered username "wouter@mail.com" and password "123456"
        And clicks the submit button
        Then sees if he was succesfull

    Scenario: Unsuccessful login with invalid password
        Given Bob opens support-desk website
        And goes to loginpage
        When he has entered username "wouter@mail.com" and password "12345"
        And clicks the submit button
        Then sees if he was succesfull

    Scenario: Unsuccessful login with invalid username
        Given Bob opens support-desk website
        And goes to loginpage
        When he has entered username "wouter@mail123456.com" and password "123456"
        And clicks the submit button
        Then sees if he was succesfull