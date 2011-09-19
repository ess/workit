require 'aruba'
require 'aruba/cucumber'
require 'fileutils'

ENV['PATH'] = "#{File.expand_path(File.dirname(__FILE__) + '../../bin')}#{File::PATH_SEPARATOR}#{ENV['PATH']}"
WORKIT_LIB_PATH = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'lib'))

TMP_PATH = 'tmp/aruba'

Before do
  FileUtils.rm_f '/tmp/workit_test.db' 
  @dirs = [ TMP_PATH ]
end

After do |scenario|
  ENV['RUBYLIB'] = ''
end

require 'workit'
