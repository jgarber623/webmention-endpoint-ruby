# webmention-endpoint-discovery-ruby

**A Ruby gem for discovering a given URL's [Webmention](https://indieweb.org/Webmention) endpoint.**

[![Gem](https://img.shields.io/gem/v/webmention-endpoint-discovery.svg?style=for-the-badge)](https://rubygems.org/gems/webmention-endpoint-discovery)
[![Downloads](https://img.shields.io/gem/dt/webmention-endpoint-discovery.svg?style=for-the-badge)](https://rubygems.org/gems/webmention-endpoint-discovery)
[![Build](https://img.shields.io/travis/jgarber623/webmention-endpoint-discovery-ruby/master.svg?style=for-the-badge)](https://travis-ci.org/jgarber623/webmention-endpoint-discovery-ruby)
[![Maintainability](https://img.shields.io/codeclimate/maintainability/jgarber623/webmention-endpoint-discovery-ruby.svg?style=for-the-badge)](https://codeclimate.com/github/jgarber623/webmention-endpoint-discovery-ruby)
[![Coverage](https://img.shields.io/codeclimate/c/jgarber623/webmention-endpoint-discovery-ruby.svg?style=for-the-badge)](https://codeclimate.com/github/jgarber623/webmention-endpoint-discovery-ruby/code)

## Key Features

- Compliant with [Section 3.1.2](https://www.w3.org/TR/webmention/#sender-discovers-receiver-webmention-endpoint) of the [Webmention specification](https://www.w3.org/TR/webmention/).
- Passes all Endpoint Discovery tests on [webmention.rocks](https://webmention.rocks).
- Supports Ruby 2.4 and newer.

## Getting Started



## Installation

If you're using [Bundler](https://bundler.io), add webmention-endpoint-discovery-ruby to your project's `Gemfile`:

```ruby
source 'https://rubygems.org'

gem 'webmention-endpoint-discovery', git: 'https://github.com/jgarber623/webmention-endpoint-discovery-ruby'
```

…and hop over to your command prompt and run…

```sh
$ bundle install
```

## Usage

With webmention-endpoint-discovery-ruby added to your project's `Gemfile` and installed, you may discover a URL's Webmention endpoint by doing:

```ruby
require 'webmention/endpoint_discovery'

endpoint = Webmention::EndpointDiscovery.discover('https://webmention.rocks/test/1')

puts endpoint # returns String: 'https://webmention.rocks/test/1/webmention'
```

This example will search `https://webmention.rocks/test/1` for a valid Webmention endpoint in accordance with the rules described in [the W3C's Webmention specification](https://www.w3.org/TR/webmention/#sender-discovers-receiver-webmention-endpoint). In this case, the program returns a string: `https://webmention.rocks/test/1/webmention`.

If no endpoint is discovered at the provided URL, the program will return `nil`:

```ruby
require 'webmention/endpoint_discovery'

endpoint = Webmention::EndpointDiscovery.discover('https://example.com')

puts endpoint.nil? # returns Boolean: true
```

### Exception Handling

There are several exceptions that may be raised by webmention-endpoint-discovery-ruby's underlying dependencies:

- `Addressable::URI::InvalidURIError`
- `HTTP::ConnectionError`
- `HTTP::TimeoutError`
- `HTTP::Redirector::TooManyRedirectsError`

You'll want to make sure your code gracefully handles these exceptions. For more on each of these exceptions, see:

- [sporkmonger/addressable](https://github.com/sporkmonger/addressable) – Source code for the Addressable Ruby gem
- [httprb/http](https://github.com/httprb/http) – Source code for the HTTP Ruby gem

## License

webmention-endpoint-discovery-ruby is freely available under the [MIT License](https://opensource.org/licenses/MIT). Use it, learn from it, fork it, improve it, change it, tailor it to your needs.
