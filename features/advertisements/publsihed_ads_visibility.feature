Feature: Published advertisement's visibility 

  Rule: Anyone can look through published advertisements

  Rule: Home Page must contain Basic Info about published advertisment:
          Advertisement's Title
          Advertisement's Preview image
          Advertisement's Type
          Advertisement's Date of publish

  Rule: Advertisement page must contain Full Info about published advertisement:
          Advertisement's Title
          Advertisement's Description
          Advertisement's Image(s)
          Advertisement's Type
          Advertisement's Date of publish
          Advertisement's Author nicknames

  Scenario: Guest user visits home page
    Given I am a guest user
      And There are published advertisement's
    When I visit home page
    Then It must contain published advertisements
      And Basic advertisement's info

  Scenario: Guest user visits advertisement's page
    Given I am a guest user
      And There are published advertisement's
    When I visit home page
      And click on advertisement's button
    Then It must open advertisement's page
      And This page must contain full info about advertisement

  Scenario: User visits home page
    Given I am signed in as an user
      And There are published advertisement's
    When I visit home page
    Then It must contain published advertisements
      And Basic advertisement's info

  Scenario: User visits advertisement's page
    Given I am signed in as an user
      And There are published advertisement's
    When I visit home page
      And click on advertisement's button
    Then It must open advertisement's page
      And This page must contain full info about advertisement

  Scenario: Admin visits home page
    Given I am signed in as an administrator
      And There are published advertisement's
    When I visit home page
    Then It must contain published advertisements
      And Basic advertisement's info

  Scenario: Admin visits advertisement's page
    Given I am a guest user
      And There are published advertisement's
    When I visit home page
      And click on advertisement's button
    Then It must open advertisement's page
      And This page must contain full info about advertisement
