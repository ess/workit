require 'workit/abstract_command'

module Workit
  class StartTaskCommand < Workit::AbstractCommand
    parameter 'DESCRIPTION ...', 'description of your task', :attribute_name => :description

    def execute
      Workit::Model.setup
      if Workit::Model::Task.can_start?
        task = Workit::Model::Task.new(:description => description.join(' '))
        if task.save
          task.start!
          puts "Started task '#{task.description}'"
        end
      else
        puts "'#{Workit::Model::Task.current.description}' is not yet finished"
        exit(1)
      end
    end
  end
end
