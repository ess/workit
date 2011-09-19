module Workit
  module Model
    class Span
      include DataMapper::Resource

      property :id, Serial
      property :started_at, DateTime, :required => true
      property :finished_at, DateTime

      belongs_to :task

      before :create, :set_started_at

      def duration
        (self.finished_at || Time.now).to_time.to_i - self.started_at.to_time.to_i
      end

      def set_started_at
        self.started_at = Time.now
      end
    end
  end
end
