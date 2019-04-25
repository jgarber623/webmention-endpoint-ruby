# Changelog

## 2.0.3 / 2019-04-25

- Add deprecation notice.

## 2.0.2 / 2019-01-03

- Expand supported Ruby versions to include 2.6 ([4bc127b](https://github.com/jgarber623/webmention-endpoint-ruby/commit/4bc127b)).

## 2.0.1 / 2018-11-11

- Freeze mutable objects assigned to constants ([018f735](https://github.com/jgarber623/webmention-endpoint-ruby/commit/018f735)).
- Liberalizes dependency constraints ([1db66fb](https://github.com/jgarber623/webmention-endpoint-ruby/commit/1db66fb)).

## 2.0.0 / 2018-08-18

- Renames `Webmention::Endpoint::Response` class to `Webmention::Endpoint::Request` ([db485f3](https://github.com/jgarber623/webmention-endpoint-ruby/commit/db485f3)).
- Removes `Webmention::Endpoint::Discover` class and moves its functionality to `Webmention::Endpoint::Client` ([a9ff0a9](https://github.com/jgarber623/webmention-endpoint-ruby/commit/a9ff0a9)).

## 1.0.1 / 2018-07-29

- Raise an `ArgumentError` when `Client` instantiated with non-absolute URI ([64f161e](https://github.com/jgarber623/webmention-endpoint-ruby/commit/64f161e)).

## 1.0.0 / 2018-07-17

- Adds new `Webmention::Endpoint::Client` and `Webmention::Endpoint::Response` classes and refactors `Webmention::Endpoint::Discover` API ([a05d041](https://github.com/jgarber623/webmention-endpoint-ruby/commit/a05d041)).
- Updates specs ([706f39b](https://github.com/jgarber623/webmention-endpoint-ruby/commit/706f39b)) and documentation ([7110b8c](https://github.com/jgarber623/webmention-endpoint-ruby/commit/7110b8c)).

## 0.3.1 / 2018-07-05

- Updates [Absolutely](https://github.com/jgarber623/absolutely) to v1.1.0 ([4a62800](https://github.com/jgarber623/webmention-endpoint-ruby/commit/4a62800)).

## 0.3.0 / 2018-07-05

- Adds [Absolutely](https://github.com/jgarber623/absolutely) gem dependency for handling conversion of relative URLs to absolute URLs ([2b8f924](https://github.com/jgarber623/webmention-endpoint-ruby/commit/2b8f924)).

## 0.2.0 / 2018-06-25

- Adds `Webmention::Endpoint::Error` class and subclasses ([f81852f](https://github.com/jgarber623/webmention-endpoint-ruby/commit/f81852f)).

## 0.1.0 / 2018-06-24

- Initial release!
