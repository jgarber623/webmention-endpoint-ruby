describe Webmention::Endpoint::Discover do
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

  context 'when given a valid URL' do
    let(:url) { 'https://example.com' }

    describe '#response' do
      it 'returns an HTTP::Response' do
        expect(described_class.new(url).response).to be_an_instance_of(HTTP::Response)
      end
    end

    describe '#uri' do
      it 'returns an Addressable::URI' do
        expect(described_class.new(url).uri).to be_an_instance_of(Addressable::URI)
      end
    end

    describe '#url' do
      it 'returns the URL' do
        expect(described_class.new(url).url).to eq(url)
      end
    end
  end
end
