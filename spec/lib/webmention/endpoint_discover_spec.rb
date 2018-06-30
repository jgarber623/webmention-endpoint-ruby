describe Webmention::Endpoint, '.discover' do
  context 'when given a URL that does not advertise an endpoint' do
    let(:url) { 'https://example.com' }

    it 'returns nil' do
      expect(described_class.discover(url)).to be_nil
    end
  end

  context 'when given a URL advertising its endpoint in an HTTP Link header' do
    let(:url) { 'https://webmention.rocks/test/1' }

    let(:endpoint) { 'https://webmention.rocks/test/1/webmention' }

    it 'returns the endpoint' do
      expect(described_class.discover(url)).to eq(endpoint)
    end
  end

  # TODO: Rework these specs to use WebMock: https://github.com/bblimke/webmock
  context 'when running the webmention.rocks Endpoint Discovery tests' do
    WebmentionRocks::ENDPOINT_DISCOVERY_TESTS.each do |url, endpoint_regexp|
      it 'returns the endpoint' do
        expect(described_class.discover(url)).to match(endpoint_regexp)
      end
    end
  end
end
