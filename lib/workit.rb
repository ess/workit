module Workit
  require 'workit/version'
  require 'workit/model'
  require 'workit/abstract_command'
  require 'workit/start_task_command'
  require 'workit/finish_task_command'
  require 'workit/pause_task_command'

  class MainCommand < Workit::AbstractCommand
    subcommand 'start', 'Start a task', StartTaskCommand
    subcommand 'finish', 'Finish the current task', FinishTaskCommand
    subcommand 'pause', 'Pause the current task', PauseTaskCommand
  end
end
