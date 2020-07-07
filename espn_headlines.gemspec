require_relative 'lib/espn_headlines/version'

Gem::Specification.new do |spec|
  spec.name          = "espn_headlines"
  spec.version       = EspnHeadlines::VERSION
  spec.authors       = ["Ian Hutson"]
  spec.email         = ["ih00209@georgiasouthern.edu"]

  spec.summary       = %q{A CLI application that allows a user to view espn.com headlines and read their respective articles.}
  spec.description   = %q{A required project for Flatiron School module 1.}
  spec.homepage      = "https://github.com/ianhutson/espn-headlines/"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ianhutson/espn-headlines"
  spec.metadata["changelog_uri"] = "https://github.com/ianhutson/espn-headlines"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency 'pry'
  spec.add_dependency "nokogiri"
end
