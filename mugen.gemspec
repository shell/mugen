# coding: UTF-8
require 'mugen/version'
Gem::Specification.new do |s|
  s.name              = "mugen"
  s.version           = Mugen::VERSION
  s.platform          = Gem::Platform::RUBY
  s.authors           = ["Vladimir Penkin"]
  s.email             = ["penkinv@gmail.com"]
  s.homepage          = "http://github.com/shell/mugen"
  s.summary           = "MyGengo API wrapper"
  s.description       = "MyGengo API wrapper(http://mygengo.com/services/api/dev-docs/)"
  s.rubyforge_project = s.name

  s.required_rubygems_version = ">= 1.3.6"
  
  s.add_runtime_dependency 'activesupport'
  s.add_runtime_dependency 'httparty'
  s.add_runtime_dependency 'haml'
  s.add_runtime_dependency 'ruby-hmac'
  
  s.add_development_dependency "ruby-debug"
  s.add_development_dependency "rspec"

  # The list of files to be contained in the gem
  s.files         = `git ls-files`.split("\n")
  # s.executables   = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  # s.extensions    = `git ls-files ext/extconf.rb`.split("\n")
  
  s.require_path = 'lib'

  # For C extensions
  # s.extensions = "ext/extconf.rb"
end
