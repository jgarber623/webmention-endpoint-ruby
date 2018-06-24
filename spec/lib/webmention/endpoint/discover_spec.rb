describe Webmention::Endpoint::Discover do
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
