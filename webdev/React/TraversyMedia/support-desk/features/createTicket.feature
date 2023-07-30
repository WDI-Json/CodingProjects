Feature: creating a ticket
    As a user
    I want to send a message
    So that I get assistance regarding my bought product
    
   Background: User already logged in on Mainpage
    Given Alex is logged in and on the main page

  Scenario: Creating a new ticket
    When Alex clicks on the "Create New Ticket" button
    Then should be taken to the ticket creation page
    When Alex fills in fields and submits the ticket
    Then Alex should see an alert-message/succes-message

  Scenario: Submitting an incomplete ticket
    When Alex clicks on the "Create New Ticket" button
    And Alex should be taken to the ticket creation page
    When Alex fills in fields and submits the ticket
    Then Alex should see an alert-message/succes-message


    