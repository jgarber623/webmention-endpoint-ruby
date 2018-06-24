module Webmention
  module Endpoint
    class Discover
      HTTP_HEADERS_OPTS = {
        accept: '*/*',
        user_agent: 'Webmention Endpoint Discovery (https://rubygems.org/gems/webmention-endpoint)'
      }.freeze

      # Liberal pattern matching a string of text between angle brackets
      # https://tools.ietf.org/html/rfc5988#section-5.1
      REGEXP_TARGET_URI_PATTERN = /^<(.*)>;/

      # Ultra-orthodox pattern matching allowed values in Link header `rel` parameter
      # https://tools.ietf.org/html/rfc8288#section-3.3
      REGEXP_REG_REL_TYPE_PATTERN = '[a-z\d][a-z\d\-\.]*'.freeze

      # Ultra-orthodox pattern matching Link header `rel` parameter including a `webmention` value
      # https://www.w3.org/TR/webmention/#sender-discovers-receiver-webmention-endpoint-p-1
      REGEXP_WEBMENTION_REL_PATTERN = /(?:;|\s)rel="?(?:#{REGEXP_REG_REL_TYPE_PATTERN}+\s)?webmention(?:\s#{REGEXP_REG_REL_TYPE_PATTERN})?"?/

      attr_reader :uri, :url

      def initialize(url)
        raise ArgumentError, "url must be a String (given #{url.class.name})" unless url.is_a?(String)

        @url = url
        @uri = Addressable::URI.parse(url)
      end

      def endpoint
        @endpoint ||= absolutize(base: url, relative: (endpoint_from_headers || endpoint_from_body)) || nil
      end

      def response
        @response ||= HTTP.follow.headers(HTTP_HEADERS_OPTS).timeout(
          connect: 10,
          read: 10
        ).get(uri)
      end

      private

      def absolutize(base:, relative:)
        return unless relative

        base_uri = Addressable::URI.parse(base)
        relative_uri = Addressable::URI.parse(relative)

        return relative if relative_uri.absolute?

        (base_uri + relative_uri).to_s
      end

      def endpoint_from_body
        return unless response.mime_type == 'text/html'

        doc = Nokogiri::HTML(response.body.to_s)

        # Search response body for first `a` or `link` element with valid `rel` and `href` attributes
        link_element = doc.css('[rel~="webmention"][href]').select { |element| %w[a link].include?(element.name) }.shift

        return link_element['href'] if link_element
      end

      def endpoint_from_headers
        link_headers = response.headers.get('link')

        return unless link_headers

        # Split Link headers with multiple values, flatten the resulting array, and strip whitespace
        # https://webmention.rocks/test/19
        link_headers = link_headers.map { |header| header.split(',') }.flatten.map(&:strip)

        webmention_header = link_headers.find { |header| header.match?(REGEXP_WEBMENTION_REL_PATTERN) }

        return unless webmention_header

        endpoint_match_data = webmention_header.match(REGEXP_TARGET_URI_PATTERN)

        return endpoint_match_data[1] if endpoint_match_data
      end
    end
  end
end
