Feature: Login

Rule: correct credentials are entered

    Scenario: Bob wants to login
        Given Bob opens support-desk website
        And navigates to /login
        When he has filled in correct credentials
        Then Bob is navigated to the homepage 
        And is able to view his tickets