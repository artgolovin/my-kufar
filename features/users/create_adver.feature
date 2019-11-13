Feature: Users can create advertisements

  In order to publish my advertisement
  As an user
  I want to create new advertisement

  Scenario: User creates advertisement
    Given I am signed in as an user
    When I create new advertisement
    Then This advertisement must appear in my dashboard

  Scenario: User cannot create advertisement, when there are no types
    Given I am signed in as an user
      And There are no advertisement's types
    When I want go to my dahsboard
    Then I can't create new advertisement
