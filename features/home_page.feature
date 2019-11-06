Feature: Home Page

  As a guest user
  I want to see on home page only published, sorted advertisements
  I should be able to open advertisement's page

  Scenario: Visiting home page

    Given I am a guest user
      And There are published advertisements
      And There are hidden advertisements
    When I visit home page
    Then I must see only published advertisements
      And I mustn't see any of hidden advertisements
      And Fresh advertisements showed first by default

  Scenario: Opening Advertisement Page
  
    Given I am a guest user
      And There are published advertisements
    When I visit home page
      And I click on advertisement
    Then It must open advertisement's page
      And It should contain advertisement's description
