require 'spec_helper'

module Workit
  describe StartTaskCommand do
    it 'should be an AbstractCommand' do
      Workit::StartTaskCommand.ancestors.should include(Workit::AbstractCommand)
    end

    it 'should have a "description" parameter' do
      Workit::StartTaskCommand.parameters.map(&:attribute_name).should include 'description'
    end
  end
end
