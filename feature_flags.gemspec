# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'feature_flags/version'

Gem::Specification.new do |gem|
  gem.name          = "feature_flags"
  gem.version       = FeatureFlags::VERSION
  gem.authors       = ["pandurang"]
  gem.email         = ["pandurang.plw@gmail.com"]
  gem.description   = "Manage (turn on/off) different features in your rails app."
  gem.summary       = "Manage (turn on/off) different features in your rails app."
  gem.homepage      = "https://github.com/pandurang90/feature_flags"

  gem.files         = `git ls-files`.split("\n")
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.license = 'MIT'
  gem.add_dependency "activesupport" 
  gem.add_dependency "rails"        
end
