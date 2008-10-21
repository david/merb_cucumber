Feature: Login
  To ensure the safety of the application
  A regular user of the system
  Must authenticate before using the app

  Scenario: Failed Login
    Given I am not authenticated
    When I go to /login
    And I fill in "login" with "i_dont_exist"
    And I fill in "password" with "and_i_dont_have_a_password"
    And I press "Log In"
    Then I should see "Login or Password were incorrect"
    And I should remain unauthenticated
