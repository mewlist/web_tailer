$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "web_tailer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "web_tailer"
  s.version     = WebTailer::VERSION
  s.authors     = ["mewlist"]
  s.email       = ["mewlist@mewlist.com"]
  s.homepage    = ""
  s.summary     = "'tail -f' on Rails"
  s.description = ""

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.0"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
