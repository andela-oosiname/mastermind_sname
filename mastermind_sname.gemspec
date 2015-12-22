# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mastermind_sname/version'

Gem::Specification.new do |spec|
  spec.name          = "mastermind_sname"
  spec.version       = MastermindSname::VERSION
  spec.authors       = ["Olumuyiwa Osiname"]
  spec.email         = ["olumuyiwa.osiname@andela.com"]

  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  # end

  spec.summary       = %q{This installs mastermind on the pc.}
  spec.description   = %q{Mastermind is a game where a user tries to guess a sequence of colour codes.}
  spec.homepage      = "https://github.com/andela-oosiname/mastermind_sname"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
