require 'spec_helper'

module Workit
  describe Model do
    describe '.get_sqlite_db' do
      before :each do
        ENV['HOME'] = '/home/somebody'
      end
      context 'in testing' do
        it 'should return /tmp/workit_test.db' do
          ENV['WORKIT_ENV'] = 'test'
          Workit::Model.get_sqlite_db.should == '/tmp/workit_test.db'
        end
      end
      context 'not in testing' do
        it 'should return $HOME/.workit/database.db' do
          ENV['WORKIT_ENV'] = nil
          Workit::Model.get_sqlite_db.should == '/home/somebody/.workit/database.db'
        end
      end
    end
    it 'should have a setup method' do
      Workit::Model.should respond_to(:setup)
    end
  end
end
