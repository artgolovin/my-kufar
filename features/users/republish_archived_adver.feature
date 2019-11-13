Feature: Users can edit republish their archived advertisements

  In order to republish archived advertisement, which belongs to me
  As an user
  I can edit my archived advertisement and push it to review

  Scenario: User pushes his correctly edited, archived advertisement to review
    Given I am signed in as an user
      And There is an archived advertisement, which belongs to me
    When I edit this advertisement correctly
      And I push this advertisement to review
    Then Page must contain approval message
      And an administrator could see this advertisement

  Scenario: User pushes his incorrectly edited, archived advertisement to review
    Given I am signed in as an user
      And There is an archived advertisement, which belongs to me
    When I edit this advertisement incorrectly
      And I try to push it to review
    Then Page must contain warning
      And This advertisement mustn't pushed to review
