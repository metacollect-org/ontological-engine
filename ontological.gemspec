$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'ontological/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'ontological'
  s.version     = Ontological::VERSION
  s.authors     = ['Moritz E. Beber']
  s.email       = ['midnighter@posteo.net']
  s.homepage    = 'https://github.com/metacollect-org/'
  s.summary     = 'The ontological rails engine provides models and logic for working with categories similar to an RDF triple store.'
  s.description = 'Insert README here.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'spec/factories/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '~> 5.0.0', '>= 5.0.0.1'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rubocop-rspec'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'fuubar'
end
