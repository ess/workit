require 'clamp'
require 'workit/version'

module Workit
  class AbstractCommand < Clamp::Command
    option ['-v', '--verbose'], :flag, 'be verbose'

    option '--version', :flag, 'show version' do
      puts "Workit #{Workit::VERSION}"
      exit(0)
    end
  end
end
