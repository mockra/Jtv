require_relative '../../lib/jtv/stream'

class Client; include Jtv::Stream; end

describe Jtv::Stream do
  let(:client) { Client.new }

  describe '#summary' do
    it 'sends summary and params to get' do
      expect(client).to receive(:get).with 'streams/summary.json',
        { channel: 'test' }
      client.summary channel: 'test'
    end
  end

  describe '#featured' do
    it 'sends featured and params to get' do
      expect(client).to receive(:get).with 'streams/featured.json',
        { channel: 'test' }
      client.featured channel: 'test'
    end
  end

  describe '#search' do
    it 'sends search and params to get' do
      expect(client).to receive(:get).with 'search/streams.json?q=test%20ruby',
        { limit: 50 }
      client.search 'test ruby', limit: 50
    end
  end
end
