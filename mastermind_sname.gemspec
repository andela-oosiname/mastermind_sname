lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mastermind_sname/version"

Gem::Specification.new do |spec|
  spec.name          = "mastermind_sname"
  spec.version       = "2.0"
  spec.authors       = ["Olumuyiwa Osiname"]
  spec.email         = ["olumuyiwa.osiname@andela.com"]
  spec.summary       = ["This installs mastermind on the pc."]
  spec.description   = ["Mastermind is a game where a user tries to"\
                        " guess a sequence of colour codes."]
  spec.homepage      = "https://github.com/andela-oosiname/mastermind_sname"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = ["mastermind"]
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
