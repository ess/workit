require File.join([File.dirname(__FILE__), 'lib', 'workit', 'version.rb'])
spec = Gem::Specification.new do |s|
  s.name = 'workit'
  s.version = Workit::VERSION
  s.author = 'Dennis Walters'
  s.email = 'dwaltersii@gmail.com'
  s.homepage = 'https://github.com/ess/workit'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A CLI time tracker'
  s.files = %w(
    bin/workit
    lib/workit.rb
    lib/workit/model.rb
    lib/workit/version.rb
    lib/workit/model/span.rb
    lib/workit/model/task.rb
    lib/workit/abstract_command.rb
    lib/workit/start_task_command.rb
    README.md
  )
  s.require_paths << 'lib'
  s.rdoc_options << '--title' << 'workit' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'workit'
  s.add_dependency('clamp', '~> 0.2.3')
  s.add_dependency('data_mapper', '~> 1.1.0')
  s.add_dependency('dm-sqlite-adapter', '~> 1.1.0')
  s.add_dependency('state_machine', '~> 1.0.1')
  s.add_development_dependency('rake', '~> 0.9.2')
  s.add_development_dependency('rdoc', '~> 3.8')
  s.add_development_dependency('reek', '~> 1.2.8')
  s.add_development_dependency('rspec', '~> 2.6.0')
  s.add_development_dependency('coco', '~> 0.5.1')
  s.add_development_dependency('cucumber', '~> 1.0.2')
  s.add_development_dependency('aruba', '~> 0.4.3')

end
