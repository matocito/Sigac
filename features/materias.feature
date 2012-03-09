Feature: Manage Materias
  In order to make a materia
  As a administrador
  I want to create and manage materias
  
  Scenario: Materias List
    Given I am signed in as an administrador
    And a materia exists with a nome of "Materia"
    When I go to materias page
    Then I should see "Materia"
    
  Scenario: Create a materia
    Given I am signed in as an administrador
    When I go to the new materia page
    And I create a materia
    Then I should be able to edit it
  
  Scenario: Edit a materia
    Given I am signed in as an administrador
    And a materia exists with a nome of "Materia"
    When I go to edit materia page
    And I edit materia nome to "Materia Edit"
    Then I should see "Materia Edit"
    
  Scenario: Delete a materia
    Given I am signed in as an administrador
    And a materia exists with a nome of "Materia"
    When I go to materias page
    And I delete that materia
    Then I should not see "Materia"
