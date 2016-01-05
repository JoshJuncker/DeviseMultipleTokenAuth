$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "devise_multiple_token_auth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "devise_multiple_token_auth"
  s.version     = DeviseMultipleTokenAuth::VERSION
  s.authors     = ["Josh Juncker"]
  s.email       = ["joshjuncker@outlook.com"]
  s.homepage    = "https://github.com/joshjuncker/DeviseMultipleTokenAuth"
  s.summary     = "Multiple device token authentication for devise"
  s.description = "If you like to use Devise, but wish it had an easy token authentication system that handles a user logging in from multiple devices, DeviseMultipleTokenAuth is for you."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.2.0"
  s.add_dependency "devise", ">= 3.5.2"
  s.add_dependency "slim"

  # s.add_development_dependency "sqlite3"
end
