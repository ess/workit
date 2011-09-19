require 'spec_helper'

module Workit
  module Model
    describe Span do
      describe '#duration' do
        before :each do
          @span = Workit::Model::Span.new(:started_at => Time.now, :finished_at => Time.now + 5)
        end
        it 'returns an integer' do
          @span.duration.should be_a(Integer)
        end
        it 'returns the difference between the start and finish' do
          @span.duration.should == 5
        end
      end
      describe '#set_started_at' do
        before :each do
          @span = Workit::Model::Span.new
        end
        it 'sets started_at to a DateTime' do
          @span.started_at.should_not be_a(DateTime)
          @span.set_started_at
          @span.started_at.should be_a(DateTime)
        end
      end
    end
  end
end
