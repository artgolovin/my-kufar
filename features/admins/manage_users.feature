Feature: Administrator manages users

  As an administrator
  I want to manage users

  Scenario: Administrator creates new user
    Given I am signed in as an administrator
    When I create a new user with correct info
    Then This user must appear
      And Page must contain approval message about creating new user

  Scenario: Administrator creates new administrator
    Given I am signed in as an administrator
    When I create a new administrator
    Then This administrator must appear
      And Page must contain approval message about creating new administrator

  Scenario: Administrator changes user's personal info
    Given I am signed in as an administrator
      And There is a user
    When I change this user's personal info
    Then The user's personal info must change
      And Page must contain approval message about changing user's personal info

  Scenario: Administrator changes users's role
    Given I am signed in as an administrator
      And There is a user
    When I change his role to administrator
    Then His role must change to administrator
      And Page must contain approval message about making user administrator

  Scenario: Administrator deletes user
    Given I am signed in as an administrator
      And There is a user
    When I delete this user
    Then This user must disappear
      And Page must contain approval message about deleting user
