Feature: User should start a task
  As a developer
  In order to track my time
  I want the ability to start a task

  Scenario: Start a task successfully
    Given there are no tasks
    When I run `workit start working on task 1`
    Then the exit status should be 0
    And the output should contain:
    """
    Started task 'working on task 1'

    """
    And there should be a task described by "working on task 1"

  Scenario: Fail to start a new task when there is an already started task
    Given I start the task "working on task 1"
    When I run `workit start working on task 2`
    Then the exit status should be 1
    And the output should contain:
    """
    'working on task 1' is not yet finished

    """
    And the task list contains 1 task
