describe Webmention::EndpointDiscovery do
  describe '#discover' do
    it 'raises an ArgumentError when not given a String' do
      message = 'url must be a String (given NilClass)'

      expect { described_class.discover(nil) }.to raise_error(ArgumentError, message)
    end
  end
end
