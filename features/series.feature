Feature: Manager Series
  Scenario: Series List
    Given I am signed in as an administrador
    And a serie exists with a titulo of "1 Serie"
    When I go to series page
    Then I should see "1 Serie"
  
