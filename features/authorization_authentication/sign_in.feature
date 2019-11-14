Feature: Users sing in

  In order to get access for managing content
  As an administrator or an user
  I want to sign in my dashboard

  Scenario: Administrator signs in with correct credentials
    Given There is an administrator
    When I sign as an administrator with correct credentials
    Then It must show dashboard
      And Page must contain welcome message for administrator

  Scenario: User signs in with correct credentials
    Given There is a user
    When I am sign as an user with correct credentials
    Then It must show dashboard
      And Page must contain welcome message for user

  Scenario: When someone tries to sign in with wrong credentials
    Given There is no person with this credentials
    When I try to sign in with this credentials
    Then Page must contain warning about wrong credentials
