Feature: Hidden advertisements visibility

  Rule: Draft advertisements are only visible for owner
  Rule: New advertisement are only visible for owner and administrator
  Rule: Rejected advertisements are only visible for owner
  Rule: Approved advertisements are only visible for owner an administrator
  Rule: Archived advertisements are only visible for owner

  Scenario: User Mike open his dashboard
    Given I am logged in as an user Mike
      And There are hidden advertisements, which belongs to Mike
      And There are hidden advertisements, which belongs to Nick
    When I open user's dashboard
    Then Dashboard must contain my advertisements
      But It mustn't contain Nick's advertisements

  Scenario: Administrator visits his dashboard
    Given I am logged in as an administrator
      And There are hidden advertisements, which belongs to Mike
    When I open admin's dashboard
    Then Dahsboard must contain new and approved Mike's advertisements
      But Dasboard mustn't contain draft, rejected and archived Mike's advertisements
