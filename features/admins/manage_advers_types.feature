Feature: Administrator manages types of advertisements

  In order to manage types of advertisements
  As an administrator
  I want to create a new type of advertisement
  And delete a type of advertisement
    If there are now advertisements of this type

  Scenario: Administrator creates a new, non-empty type of advertisement
    Given I am signed in as an administrator
    When I create a new, non-empty type of advertisement
    Then Page must contain approval message about creating new type of advertisment
      And Then this type must appear

  Scenario: Administrator creates a new, empty type of advertisement
    Given I am signed in as an administrator
    When I create a new, empty type of advertisement
    Then Page must contain warning message about empty name of type
      And Then this type mustn't appear

  Scenario: Administrator deletes a type of ads, when there are now such ads
    Given I am signed in as an administrator
      And There is a type of non-existing advertisements
    When I delete allowed type of advertisement
    Then Page must contain approval message about deleted type
      And This type must disappear

  Scenario: Administrator tries to delete a type of ads, when there ads of this type
    Given I am signed in as an administrator
      And There is a type of advertisement
      And There is an advertisement of this type
    When I try to delete this type of advertisement
    Then Page must contain warning about existing advertisements of this type
      And This type must persist
