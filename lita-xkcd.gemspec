Gem::Specification.new do |spec|
  spec.name          = "lita-xkcd"
  spec.version       = "0.0.3"
  spec.authors       = ["Mitch Dempsey"]
  spec.email         = ["mrdempsey@gmail.com"]
  spec.description   = %q{Adds a Lita handler to provide access to xkcd comics.}
  spec.summary       = %q{Adds a Lita handler to provide access to xkcd comics.}
  spec.homepage      = "https://github.com/webdestroya/lita-xkcd"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", "~> 2.2"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 2.14"
  
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
end
