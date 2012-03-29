# -*- encoding: utf-8 -*-
require File.expand_path('../lib/jtv/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Mockra"]
  gem.email         = ["david@mockra.com"]
  gem.description   = %q{Gem for quickly accessing the Justin.TV API}
  gem.summary       = %q{This tool provides simple Rails integration for common Justin.TV API calls.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "jtv"
  gem.require_paths = ["lib"]
  gem.version       = Jtv::VERSION

  gem.add_development_dependency 'rspec'
  gem.add_dependency 'json'
  gem.add_dependency 'oauth'
end
