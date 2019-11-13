Feature: Users sing in

  In order to get access for managing content
  As an administrator or an user
  I want to sign in my dashboard

  Scenario: Administrator signs in with correct credentials
    Given There is an administrator
    When I sign as an administrator with correct credentials
    Then It must show dashboard
      And Page must contain welcome message for administrators
      And Application must recognize me as an administrator
      But Page mustn't contain welcome message for users

  Scenario: User signs in with correct credentials
    Given There is a user
    When I am sign as an user with correct credentials
    Then It must show dashboard
      And Page must contain welcome message for users
      And Application must recognize me as an user
      But Page mustn't contain welcome message for administrators

  Scenario: When someone tries to sign in with wrong credentials
    Given There is no person with this credentials
    When I try to sign in with this credentials
    Then Application mustn't recognize me
      And Page must contain warning about wrong credentials
