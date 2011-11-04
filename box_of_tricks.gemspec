$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "box_of_tricks/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "box_of_tricks"
  s.version     = BoxOfTricks::VERSION
  s.authors     = ["Gavin Morrice"]
  s.email       = ["gavin@gavinmorrice.com"]
  s.homepage    = "TODO"
  s.summary     = "A collection of CSS classes and Rails helper methods"
  s.description = "A collection of CSS classes and Rails helper methods. View the README for more info"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.1"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
