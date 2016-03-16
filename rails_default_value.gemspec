# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_default_value/version'

Gem::Specification.new do |spec|
  spec.name          = "rails_default_value"
  spec.version       = RailsDefaultValue::VERSION
  spec.authors       = ["Keith Rowell"]
  spec.email         = ["keith@keithrowell.com"]
  spec.summary       = "default values for active record models"
  spec.description   = "set default values for your active record models with a simple, concise DSL. \n\n:    default :field_name => :value"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
