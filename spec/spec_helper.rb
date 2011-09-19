require 'coco'

RSpec.configure do |config|
  config.before :all do
    ENV['WORKIT_ENV'] = 'test'
    FileUtils.rm_f '/tmp/workit_test.db'
  end

end

require 'workit'

