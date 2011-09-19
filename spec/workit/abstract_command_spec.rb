require 'spec_helper'

module Workit
  describe AbstractCommand do
    it 'should be a Clamp command' do
      Workit::AbstractCommand.ancestors.should include(Clamp::Command)
    end
  end
end
