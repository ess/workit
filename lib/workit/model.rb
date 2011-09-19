require 'data_mapper'
#require 'mpatch/adapter'
require 'state_machine'

module Workit
  module Model

    require 'workit/model/task'
    require 'workit/model/span'

    def self.get_sqlite_db
      if ENV['WORKIT_ENV'] == 'test'
        "/tmp/workit_test.db"
      else
        File.expand_path(File.join(ENV['HOME'], '.workit', 'database.db'))
      end
    end

    def self.setup
      FileUtils.mkdir_p(File.dirname(get_sqlite_db))
      DataMapper.setup(:default, "sqlite://#{get_sqlite_db}")
      DataMapper.finalize
      DataMapper.auto_upgrade!
    end
  end
end
