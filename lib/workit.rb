module Workit
  require 'workit/version'
  require 'workit/model'
  require 'workit/abstract_command'
  require 'workit/start_task_command'
  require 'workit/finish_task_command'

  class MainCommand < Workit::AbstractCommand
    subcommand 'start', 'Start a task', StartTaskCommand
    subcommand 'finish', 'Finish the current task', FinishTaskCommand
  end
end
