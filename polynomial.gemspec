# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'polynomial/version'

Gem::Specification.new do |spec|
  spec.name          = "polynomial"
  spec.version       = Polynomial::VERSION
  spec.authors       = ["Adriano Mitre", "February Keeney", "Huilin Chen"]
  spec.email         = ["fskai@on-site.com"]
  spec.summary       = 'Rich-featured single and multiple variables polynomials classes for Ruby.'
  spec.homepage      = "https://github.com/on-site/polynomial"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
