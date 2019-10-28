Feature: Home Page

  As an any user
  I want to see on home page only published, sorted advertisements

  Scenario: Visiting home page

    Given I am an any user
      And There are published advertisements
      And There are hidden advertisements
    When I visit home page
    Then I must see only published advertisements
      And I mustn't see any of hidden advertisements
      And Fresh advertisements showed first by default
