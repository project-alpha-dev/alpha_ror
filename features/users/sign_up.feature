Feature: Sign up user account
  In order to have an account for personalised experience of the site
  Potential users should be able to create / sign up for an account

  Scenario: Visiting the sign up page should prompt for necessary info
    Given I am not signed in
    When I go to the user sign up page
    Then I should see "Sign up"
    And I should see "First name"
    And I should see "Last name"
    And I should see "Email"
    And I should see "Date of birth"
    And I should see "User name"
    And I should see "Password"
    And I should see "Password confirmation"

  Scenario: Sign up with a valid credential
    Given I am not signed in
    When I go to the user sign up page
    And I fill in "First name" with "John"
    And I fill in "Last name" with "Doe"
    And I fill in "Email" with "email@address.com"
    And I fill in "Date of birth" with "15-02-1976"
    And I fill in "User name" with "jdoe"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Sign up"
    Then I should be redirected to the user sign in page
    And I should see "You have signed up successfully."
    And I should receive a confirmation email at "email@address.com"
