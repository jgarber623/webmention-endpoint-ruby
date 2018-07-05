require 'absolutely'
require 'addressable/uri'
require 'http'
require 'nokogiri'

require 'webmention/endpoint/version'
require 'webmention/endpoint/error'
require 'webmention/endpoint/discover'

module Webmention
  module Endpoint
    def self.discover(url)
      Discover.new(url).endpoint
    end
  end
end
