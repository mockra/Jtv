# -*- encoding: utf-8 -*-
require File.expand_path('../lib/jtv/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["David Ratajczak"]
  gem.email         = ["david@mockra.com"]
  gem.description   = %q{Ruby wrapper for the Justin.tv and Twitch.tv API}
  gem.summary       = %q{Justin.tv and Twitch.tv API library}
  gem.homepage      = "http://mockra.com"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "jtv"
  gem.require_paths = ["lib"]
  gem.version       = Jtv::VERSION

  gem.license = 'MIT'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'webmock'
  gem.add_dependency 'faraday'
  gem.add_dependency 'json'
  gem.add_dependency 'simple_oauth'
end
