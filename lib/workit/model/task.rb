module Workit
  module Model
    class Task
      include DataMapper::Resource

      property :id, Serial
      property :description, String, :required => true
      property :state, String

      has n, :spans

      state_machine :state, :initial => :unstarted do
        event :start do
          transition :unstarted => :started
        end

        event :finish do
          transition :started => :finished
        end

        before_transition any => :started do |transition|
          self.spans.create(:started_at => Time.now)
        end

        before_transition :started => :finished do |transition|
          self.spans.first(:finished_at => nil).update!(:finished_at => Time.now)
        end
      end

      before :destroy, :destroy_spans

      def self.can_start?
        self.all(:state => 'started').empty?
      end

      def self.can_finish?
        self.all(:state.not => 'finished').count == 1
      end

      def self.current
        self.first(:state.not => 'finished')
      end

      def duration
        self.spans.map(&:duration).inject :+
      end

      def destroy_spans
        self.spans.all.map(&:destroy)
      end
    end
  end
end
