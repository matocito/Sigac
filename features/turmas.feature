Feature: Manage Turma
  Scenario: Turmas List
    Given I am signed in as an administrador
    And a turma exists with a nome of "Turma 1"
    When I go to turmas page
    Then I should see "Turma 1"
