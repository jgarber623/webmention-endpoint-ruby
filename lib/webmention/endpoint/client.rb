module Webmention
  module Endpoint
    class Client
      def initialize(url)
        raise ArgumentError, "url must be a String (given #{url.class.name})" unless url.is_a?(String)

        @uri = Addressable::URI.parse(url)

        raise ArgumentError, 'url must be an absolute URI (e.g. https://example.com)' unless @uri.absolute?
      rescue Addressable::URI::InvalidURIError => error
        raise InvalidURIError, error
      end

      def endpoint
        @endpoint ||= Discover.new(response).endpoint
      end

      def response
        @response ||= Request.new(@uri).response
      end
    end
  end
end
