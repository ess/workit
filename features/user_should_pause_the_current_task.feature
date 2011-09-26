Feature: User should pause the current task
  As a developer
  I have a lot of responsibilities
  So I want the ability to pause the current task

  Scenario: Pause the current task successfully
    Given there are no tasks
    And I start the task "obligatory task to pause"
    When I run `workit pause`
    Then the exit status should be 0
    And the output should contain:
    """
    Paused task 'obligatory task to pause'

    """

  Scenario: Fail to pause when there are no tasks
    Given there are no tasks
    When I run `workit pause`
    Then the exit status should be 1
    And the output should contain:
    """
    There are currently no tasks to pause

    """

  Scenario: Fail to pause a task when there are no started tasks
    Given there are no tasks
    And I start the task "working on task 1"
    And I finish the current task
    When I run `workit pause`
    Then the exit status should be 1
    And the output should contain:
    """
    There are currently no tasks to pause

    """
