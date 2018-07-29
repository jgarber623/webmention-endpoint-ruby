describe Webmention::Endpoint::Client do
  context 'when not given a String' do
    let(:message) { 'url must be a String (given NilClass)' }

    it 'raises an ArgumentError' do
      expect { described_class.new(nil) }.to raise_error(Webmention::Endpoint::ArgumentError, message)
    end
  end

  context 'when given an invalid URL' do
    it 'raises an InvalidURIError' do
      expect { described_class.new('http:') }.to raise_error(Webmention::Endpoint::InvalidURIError)
    end
  end

  context 'when given a relative URL' do
    let(:message) { 'url must be an absolute URI (e.g. https://example.com)' }

    it 'raises an ArgumentError' do
      expect { described_class.new('../foo/bar/biz/baz') }.to raise_error(Webmention::Endpoint::ArgumentError, message)
    end
  end
end
