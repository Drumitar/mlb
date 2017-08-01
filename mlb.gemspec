# coding: utf-8
require_relative './lib/mlb/version'

Gem::Specification.new do |s|
  s.name        = 'mlb-scores-standings'
  s.version     = Mlb::VERSION
  s.date        = '2017-08-01'
  s.summary     = "mlb scores and standings"
  s.description = "mlb scores and standings"
  s.authors     = ["Derek Pelt"]
  s.email       = 'derekpelt@gmail.com'
  s.files       = ["lib/mlb/cli.rb", "lib/mlb/game.rb", "lib/mlb/scraper.rb", "lib/mlb/version.rb", "lib/mlb.rb"]
  s.homepage    = 'http://rubygems.org/gems/mlb-scores-standings'
  s.license     = 'MIT'
  s.executables << 'mlb-scores-standings'

  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", ">= 0"
  s.add_development_dependency "nokogiri", ">= 0"
  s.add_development_dependency "pry", ">= 0"
  s.add_development_dependency "colorize", '~> 0'
end