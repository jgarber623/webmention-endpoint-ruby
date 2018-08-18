require 'absolutely'
require 'addressable/uri'
require 'http'
require 'nokogiri'

require 'webmention/endpoint/version'
require 'webmention/endpoint/error'
require 'webmention/endpoint/client'
require 'webmention/endpoint/discover'
require 'webmention/endpoint/request'

module Webmention
  module Endpoint
    def self.discover(url)
      Client.new(url).endpoint
    end
  end
end
