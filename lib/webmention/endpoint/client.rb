module Webmention
  module Endpoint
    class Client
      def initialize(url)
        raise ArgumentError, "url must be a String (given #{url.class.name})" unless url.is_a?(String)

        @uri = Addressable::URI.parse(url)
      rescue Addressable::URI::InvalidURIError => error
        raise InvalidURIError, error
      end

      def endpoint
        @endpoint ||= Discover.new(response).endpoint
      end

      def response
        @response ||= Response.new(@uri).response
      end
    end
  end
end
