Feature: Logout

Scenario: Bob wants to logout
    Given Bob is logged in
    When he clicks logout
    Then he is not able to look at his tickets
