Feature: User should finish the current task
  As a developer
  In order to track my time
  I want the ability to finish the current task

  Scenario: Finish the current task successfully
    Given I start the task "working on task 1"
    When I run `workit finish`
    Then the exit status should be 0
    And the output should contain:
    """
    Finished task 'working on task 1'

    """
    And there should be no unfinished tasks

  Scenario: Fail to finish a task when there are no started tasks
    Given there are no tasks
    When I run `workit finish`
    Then the exit status should be 1
    And the output should contain:
    """
    There are currently no tasks to finish

    """
