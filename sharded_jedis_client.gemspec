# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "sharded_jedis_client"
  spec.version       = "2.0.0"
  spec.authors       = ["Dermot A. Harris"]
  spec.email         = ["dermot.harris@teamaol.com"]
  spec.description   = %q{Ruby wrapper of the Jedis client for Redis}
  spec.summary       = %q{Ruby wrapper of the Jedis client for Redis. The Jedis client implements sharding, which is why we use it.}
  spec.homepage      = "https://stash.ops.aol.com/users/dermotharris1/repos/sharded_jedis_client/"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "jruby-jedis", "~> 2.5"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
