require_relative 'lib/okcoin_client/version'

Gem::Specification.new do |spec|
  spec.name          = "okcoin_client"
  spec.version       = OkcoinClient::VERSION
  spec.authors       = ["Bloom Devs"]
  spec.email         = ["dev@bloom.solutions"]

  spec.summary       = %q{API wrapper for Okcoin}
  spec.description   = %q{API wrapper for Okcoin}
  spec.homepage      = "https://github.com/bloom-solutions/okcoin_client-ruby"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.pkg.github.com/bloom-solutions"
    spec.metadata["github_repo"] = "ssh://github.com/bloom-solutions/okcoin_client-ruby"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/bloom-solutions/okcoin_client-ruby"
    spec.metadata["changelog_uri"] = "https://github.com/bloom-solutions/okcoin_client-ruby/blob/master/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end


  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "api_client_base"
  spec.add_dependency "typhoeus"
  spec.add_dependency "activesupport"
  spec.add_dependency "dry-validation", ">= 0.13", "< 2"
  spec.add_dependency "addressable", "~> 2.3"

  spec.add_development_dependency "pry"
  spec.add_development_dependency "vcr", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 2.3"
  spec.add_development_dependency "appraisal"
end
