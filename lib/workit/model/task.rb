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

        before_transition any => :started do |transition|
          self.spans.create(:started_at => Time.now)
        end
      end

      def self.can_start?
        self.all(:state => 'started').empty?
      end

      def self.current
        self.first(:state.not => 'finished')
      end

      def duration
        self.spans.map(&:duration).inject :+
      end
    end
  end
end
