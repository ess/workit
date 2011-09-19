require 'workit/abstract_command'

module Workit
  class FinishTaskCommand < Workit::AbstractCommand

    def execute
      Workit::Model.setup
      if Workit::Model::Task.can_finish?
        task = Workit::Model::Task.all(:state.not => 'finished').last
        puts "Finished task '#{task.description}'" if task.finish!
      else
        puts "There are currently no tasks to finish"
        exit(1)
      end
    end
  end
end
