Feature: User
  # @javascript
  Scenario: Registration
    Given there are 0 Users
    When I visit the homepage
    And  I click "Sign up!"
    And  I fill in "user_email" with "foo@bar.com"
    And  I fill in "user_password" with "asdfasdf"
    And  I fill in "user_password_confirmation" with "asdfasdf"
    And  I press "Sign up"
    Then I should see "Welcome! You have signed up successfully."
    And  I should see "Sign out"
    And there should be 1 new User

  Scenario: Sign-in
    Given I have already registered
    And there is 1 User
    When I visit the homepage
    And  I click "Sign in!"
    And  I fill in my credentials
    And  I press "Sign in"
    Then I should see "Signed in successfully."
    And  I should see "Sign out"
    And there should be 1 User

  Scenario: Sign-out
    Given I'm logged in
    When I visit the homepage
    And  I click "Sign out"
    Then I should see "Signed out successfully."

  Scenario: Account Settings
