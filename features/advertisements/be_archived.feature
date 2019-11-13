Feature: Published advertisements after 3 days of publication must be archived

  When 3 days have passed after an advertisement's publiсation
  The advertisement must be archived

  Scenario: 3 days have passed after an advertisement's publication
    Given There is published advertisement
    When 3 days have passed
    Then This advertisement's status must change to archived
