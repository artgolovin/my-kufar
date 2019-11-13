Feature: Users can push their advertisements to review

  In order to publish advertisement
  As a user
  I want to push my new, correct advertisement for review

  Scenario: User pushes new, correct advertisement to review
    Given I am signed in as an user
      And I have a new, correct advertisement
    When I push this advertisement to review
    Then Page must contain approval message
      And an administrator could see this advertisement
      But anyone else can't see advertisement

  Scenario: User pushes new, incorrect advertisement to review
    Given I am signed in as an user
      And I have a new, incorrect advertisement
    When I push this advertisement to review
    Then Page should contain a warning message
      And This advertisement mustn't change it's status 
