Feature: Administrator manage advertisements

  In order to manage advertisements
  As an Administrator 
  I want to review new advertisements
  And delete published advertisements

  Scenario: Administrator approve user's advertisement
    Given I am signed in as an administrator
      And There is a new user's advertisement, i want to be published
    When I approve the second advertisement
    Then This advertisement's status must change to approved
      And Page must contain approval message about approving advertisement      

  Scenario: Administrator rejects user's advertisement
    Given I am signed in as an administrator
      And There is a new user's advertisement, that i don't want to be published
    When I reject this advertisement
    Then This advertisement's status must change to rejected
      And Page must contain approval message about rejecting advertisement

  Scenario: Administrator deletes published advertisement
    Given I am signed in as an administrator
      And There is a published user's advertisement
    When I delete this advertisement
    Then This advertisement must disappear
      And Page must contain approval message about deleting advertisement
