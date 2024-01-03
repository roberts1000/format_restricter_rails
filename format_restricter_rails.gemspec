lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'format_restricter_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "format_restricter_rails"
  spec.version       = FormatRestricterRails::VERSION
  spec.authors       = ["roberts1000"]
  spec.email         = ["roberts@corlewsolutions.com"]

  spec.summary       = "A Rails Engine that prevents Rails controllers from processing undesired formats."
  spec.description   = "A Rails Engine that restricts the formats that your Rails controller actions are allowed to process."
  spec.homepage      = "https://github.com/roberts1000/format_restricter_rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 3.0.0'

  spec.add_dependency "rails", ">= 5.1"
end
