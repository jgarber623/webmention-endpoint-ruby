lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'webmention/endpoint/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = ['>= 2.4', '< 2.7']

  spec.name          = 'webmention-endpoint'
  spec.version       = Webmention::Endpoint::VERSION
  spec.authors       = ['Jason Garber']
  spec.email         = ['jason@sixtwothree.org']

  spec.summary       = 'Deprecated in favor of indieweb-endpoints from 2019-04-25. Discover a URL’s Webmention endpoint.'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/jgarber623/webmention-endpoint-ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(bin|spec)/}) }

  spec.require_paths = ['lib']

  spec.post_install_message = <<NOTICE

  +------------------------------------------------------+
  |                                                      |
  |  webmention-endpoint is deprecated from 2019-04-25.  |
  |                                                      |
  |  Please use the indieweb-endpoints gem instead.      |
  |                                                      |
  +------------------------------------------------------+

NOTICE

  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.8'
  spec.add_development_dependency 'rubocop', '~> 0.67.2'
  spec.add_development_dependency 'rubocop-performance', '~> 1.0'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.31'
  spec.add_development_dependency 'simplecov', '~> 0.16.1'
  spec.add_development_dependency 'simplecov-console', '~> 0.4.2'

  spec.add_runtime_dependency 'absolutely', '~> 1.1'
  spec.add_runtime_dependency 'addressable', '~> 2.6'
  spec.add_runtime_dependency 'http', '~> 4.1'
  spec.add_runtime_dependency 'nokogiri', '~> 1.10'
end
