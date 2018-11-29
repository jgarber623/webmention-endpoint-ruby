# webmention-endpoint-ruby

**A Ruby gem for discovering a URL's [Webmention](https://indieweb.org/Webmention) endpoint.**

[![Gem](https://img.shields.io/gem/v/webmention-endpoint.svg?style=for-the-badge)](https://rubygems.org/gems/webmention-endpoint)
[![Downloads](https://img.shields.io/gem/dt/webmention-endpoint.svg?style=for-the-badge)](https://rubygems.org/gems/webmention-endpoint)
[![Build](https://img.shields.io/travis/com/jgarber623/webmention-endpoint-ruby/master.svg?style=for-the-badge)](https://travis-ci.com/jgarber623/webmention-endpoint-ruby)
[![Dependencies](https://img.shields.io/depfu/jgarber623/webmention-endpoint-ruby.svg?style=for-the-badge)](https://depfu.com/github/jgarber623/webmention-endpoint-ruby)
[![Maintainability](https://img.shields.io/codeclimate/maintainability/jgarber623/webmention-endpoint-ruby.svg?style=for-the-badge)](https://codeclimate.com/github/jgarber623/webmention-endpoint-ruby)
[![Coverage](https://img.shields.io/codeclimate/c/jgarber623/webmention-endpoint-ruby.svg?style=for-the-badge)](https://codeclimate.com/github/jgarber623/webmention-endpoint-ruby/code)

## Key Features

- Compliant with [Section 3.1.2](https://www.w3.org/TR/webmention/#sender-discovers-receiver-webmention-endpoint) of [the W3C's Webmention Recommendation](https://www.w3.org/TR/webmention/).
- Passes all Endpoint Discovery tests on [webmention.rocks](https://webmention.rocks).
- Supports Ruby 2.4 and newer.

## Getting Started

Before installing and using webmention-endpoint-ruby, you'll want to have [Ruby](https://www.ruby-lang.org) 2.4 (or newer) installed. It's recommended that you use a Ruby version managment tool like [rbenv](https://github.com/rbenv/rbenv), [chruby](https://github.com/postmodern/chruby), or [rvm](https://github.com/rvm/rvm).

webmention-endpoint-ruby is developed using Ruby 2.4.4 and is additionally tested against Ruby 2.5.3 using [Travis CI](https://travis-ci.com/jgarber623/webmention-endpoint-ruby).

## Installation

If you're using [Bundler](https://bundler.io), add webmention-endpoint-ruby to your project's `Gemfile`:

```ruby
source 'https://rubygems.org'

gem 'webmention-endpoint'
```

…and hop over to your command prompt and run…

```sh
$ bundle install
```

## Usage

### Basic Usage

With webmention-endpoint-ruby added to your project's `Gemfile` and installed, you may discover a URL's Webmention endpoint by doing:

```ruby
require 'webmention/endpoint'

endpoint = Webmention::Endpoint.discover('https://webmention.rocks/test/1')

puts endpoint # returns String: 'https://webmention.rocks/test/1/webmention'
```

This example will search `https://webmention.rocks/test/1` for a valid Webmention endpoint in accordance with the rules described in [the W3C's Webmention Recommendation](https://www.w3.org/TR/webmention/#sender-discovers-receiver-webmention-endpoint). In this case, the program returns a string: `https://webmention.rocks/test/1/webmention`.

If no endpoint is discovered at the provided URL, the program will return `nil`:

```ruby
require 'webmention/endpoint'

endpoint = Webmention::Endpoint.discover('https://example.com')

puts endpoint.nil? # returns Boolean: true
```

### Advanced Usage

Should the need arise, you may work directly with the `Webmention::Endpoint::Client` class:

```ruby
require 'webmention/endpoint'

client = Webmention::Endpoint::Client.new('https://webmention.rocks/test/1')

puts client.response # returns HTTP::Response
puts client.endpoint # returns String: 'https://webmention.rocks/test/1/webmention'
```

### Exception Handling

There are several exceptions that may be raised by webmention-endpoint-ruby's underlying dependencies. These errors are raised as subclasses of `Webmention::Endpoint::Error` (which itself is a subclass of `StandardError`).

From [jgarber623/absolutely](https://github.com/jgarber623/absolutely) and  [sporkmonger/addressable](https://github.com/sporkmonger/addressable):

- `Webmention::Endpoint::InvalidURIError`

From [httprb/http](https://github.com/httprb/http):

- `Webmention::Endpoint::ConnectionError`
- `Webmention::Endpoint::TimeoutError`
- `Webmention::Endpoint::TooManyRedirectsError`

## Contributing

Interested in helping improve webmention-endpoint-ruby? Awesome! Your help is greatly appreciated. See [CONTRIBUTING.md](https://github.com/jgarber623/webmention-endpoint-ruby/blob/master/CONTRIBUTING.md) for details.

## Acknowledgments

webmention-endpoint-ruby wouldn't exist without Webmention and the hard work put in by everyone involved in the [IndieWeb](https://indieweb.org) movement. Additionally, the comprehensive Endpoint Discovery test suite at [webmention.rocks](https://webmention.rocks) was invaluable in the development of this Ruby gem.

webmention-endpoint-ruby is written and maintained by [Jason Garber](https://sixtwothree.org).

## License

webmention-endpoint-ruby is freely available under the [MIT License](https://opensource.org/licenses/MIT). Use it, learn from it, fork it, improve it, change it, tailor it to your needs.
