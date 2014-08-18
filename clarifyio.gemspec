# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clarifyio/version'

Gem::Specification.new do |spec|
  spec.name          = "clarifyio"
  spec.version       = Clarifyio::VERSION
  spec.authors       = ["phil"]
  spec.email         = ["phil@branch14.org"]
  spec.description   = %q{A ruby wrapper and CLI for the Clarify API.}
  spec.summary       = %q{A ruby wrapper and CLI for the Clarify API.}
  spec.homepage      = "https://github.com/branch14/clarifyio"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "faraday", '~> 0.9.0'
end
