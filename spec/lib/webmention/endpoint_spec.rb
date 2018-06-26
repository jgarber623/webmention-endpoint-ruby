describe Webmention::Endpoint do
  it 'is a module' do
    expect(described_class).to be_a(Module)
  end

  describe '.discover' do
    context 'when not given a String' do
      let(:message) { 'url must be a String (given NilClass)' }

      it 'raises an ArgumentError' do
        expect { described_class.discover(nil) }.to raise_error(Webmention::Endpoint::ArgumentError, message)
      end
    end

    context 'when given an invalid URL' do
      it 'raises an InvalidURIError' do
        expect { described_class.discover('http:') }.to raise_error(Webmention::Endpoint::InvalidURIError)
      end
    end

    context 'when given a non-Webmention-enabled URL' do
      let(:url) { 'https://example.com' }

      it 'returns nil' do
        expect(described_class.discover(url)).to be_nil
      end
    end

    context 'when given a Webmention-enabled URL' do
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
end
