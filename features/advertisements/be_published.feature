Feature: Approved advertisement must be published in 3 hours

  In order to publish advertisement
  Approved advertisment must be published in 3 hours after approving

  Scenario: 3 hours have passed after advertisement approve
    Given There is approved advertisement
    When 3 hours have passed
    Then This advertisement's status must be published
