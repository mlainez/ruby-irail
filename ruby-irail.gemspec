# -*- encoding: utf-8 -*-
require File.expand_path('../lib/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Marc Lainez"]
  gem.email         = ["ml@theotherguys.be"]
  gem.description   = %q{IRail makes Belgian railway schedule easily available for anyone. This is a Ruby wrapper for their API.}
  gem.summary       = %q{Ruby Irail is a wrapper around IRail API.}
  gem.homepage      = "https://github.com/mlainez/ruby-irail"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.name          = "ruby-irail"
  gem.require_paths = ["lib"]
  gem.version       = IRail::VERSION
  gem.add_development_dependency "rspec"
  gem.add_dependency "httparty"
  gem.add_dependency "roxml"
  gem.add_dependency "json"
  gem.add_dependency "nokogiri"
end
