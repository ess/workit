require 'spec_helper'

module Workit
  module Model
    describe Task do
      describe '#duration' do
        before :each do
          Workit::Model.setup
          @task = Workit::Model::Task.new(:description => 'test task')
          @task.save
          3.times { @task.spans.create(:started_at => Time.now, :finished_at => Time.now + 5) }
        end
        it 'returns an integer' do
          @task.duration.should be_a(Integer)
        end
        it 'returns the total duration of its spans' do
          @task.duration.should == 15
        end
      end
      describe '.can_start?' do
        before :each do
          Workit::Model::Task.all.map(&:destroy)
        end
        context 'when there are no tasks' do
          it 'should return true' do
            Workit::Model::Task.can_start?.should be_true
          end
        end
        context 'when there are started tasks' do
          it 'should return false' do
            @task = Workit::Model::Task.new(:description => 'unfinished tasks')
            @task.save
            @task.start!
            Workit::Model::Task.can_start?.should be_false
          end
        end
      end
    end
  end
end
