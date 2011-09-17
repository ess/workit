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
  )
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc', 'workit.rdoc']
  s.rdoc_options << '--title' << 'workit' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'workit'
  s.add_dependency('bundler', '~> 1.0.18')
  s.add_dependency('clamp', '~> 0.2.3')
  s.add_development_dependency('rake', '~> 0.9.2')
  s.add_development_dependency('rdoc', '~> 3.8')
  s.add_development_dependency('reek', '~> 1.2.8')
  s.add_development_dependency('rspec', '~> 2.6.0')
  s.add_development_dependency('cucumber', '~> 1.0.2')
  s.add_development_dependency('aruba', '~> 0.4.3')

end
