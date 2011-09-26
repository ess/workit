require 'workit/abstract_command'

module Workit
  class PauseTaskCommand < Workit::AbstractCommand

    def execute
      Workit::Model.setup
      if Workit::Model::Task.can_pause?
        task = Workit::Model::Task.all(:state => 'started').last
        puts "Paused task '#{task.description}'" if task.pause!
      else
        puts "There are currently no tasks to pause"
        exit(1)
      end
    end
  end
end
