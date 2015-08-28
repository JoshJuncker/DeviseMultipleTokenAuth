$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "devise_multiple_token_auth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "devise_multiple_token_auth"
  s.version     = DeviseMultipleTokenAuth::VERSION
  s.authors     = ["Josh Juncker"]
  s.email       = ["josh@ringseven.com"]
  s.homepage    = "https://github.com/Verdad/DeviseMultipleTokenAuth"
  s.summary     = "Summary of DeviseMultipleTokenAuth."
  s.description = "Description of DeviseMultipleTokenAuth."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"

  s.add_development_dependency "sqlite3"
end
