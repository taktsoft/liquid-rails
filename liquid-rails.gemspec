# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'liquid-rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'taktsoft_liquid-rails'
  spec.version       = Liquid::Rails::VERSION
  spec.authors       = ['Chamnap Chhorn', 'Taktsoft Developers']
  spec.email         = ['chamnapchhorn@gmail.com', 'developers@taktsoft.com']
  spec.summary       = %q{Renders liquid templates with layout and partial support}
  spec.description   = %q{It allows you to render .liquid templates with layout and partial support. It also provides filters, tags, drops class to be used inside your liquid template.}
  spec.homepage      = 'https://github.com/taktsoft/liquid-rails'
  spec.license       = 'MIT'
  spec.required_ruby_version     = '>= 2.0.0'
  spec.required_rubygems_version = '>= 1.8.11'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.add_dependency 'rails', '>= 3.2', '< 5.1'
  spec.add_dependency 'liquid', '>= 3.0.0', '< 4.0'
  spec.add_dependency 'kaminari', '>= 0.16.1'

  spec.add_development_dependency 'bundler', '>= 1.0.0'
  spec.add_development_dependency 'rake', '>= 0'
  spec.add_development_dependency 'rspec-rails', '>= 0'
  spec.add_development_dependency 'guard-rspec', '>= 0'
  spec.add_development_dependency 'pry-rails', '>= 0'
  spec.add_development_dependency 'capybara', '>= 0'
  spec.add_development_dependency 'coveralls', '>= 0'
  spec.add_development_dependency 'simplecov', '>= 0'
end
