Feature: User deletes his advertisement

  As an user
  I want to delete my advertisement of any status

  Scenario: User deletes draft advertisement
    Given I am signed in as an user
      And There is a draft advertisement
    When I delete the draft advertisement
    Then The draft advertisement must disappear
      And Page must contain approval message about deleting advertisement

  Scenario: User deletes new advertisement
    Given I am signed in as an user
      And There is a new advertisement
    When I delete the new advertiseme
    Then The new advertisement must disappear
      And Page must contain approval message about deleting advertisement

  Scenario: User deletes rejected advertisement
    Given I am signed in as an user
      And There is a rejected advertisement
    When I delete the rejected advertisement
    Then The rejected advertisement must disappear
      And Page must contain approval message about deleting advertisement

  Scenario: User deletes approved advertisement
    Given I am signed in as an user
      And There is an approved advertisement
    When I delete the approved advertisement
    Then The approved advertisement must disappear
      And Page must contain approval message about deleting advertisement

  Scenario: User deletes published advertisement
    Given I am signed in as an user
      And There is a published advertisement
    When I delete the published advertisement
    Then The published advertisement must disappear
      And Page must contain approval message about deleting advertisement

  Scenario: User deletes archived advertisement
    Given I am signed in as an user
      And There is an archived advertisement
    When I delete the archived advertisement
    Then The archived advertisement must disappear
      And Page must contain approval message about deleting advertisement
