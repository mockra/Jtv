require_relative '../../lib/jtv/stream'

class Client; include Jtv::Stream; end

describe Jtv::Stream do
  let(:client) { Client.new }

  describe '#summary' do
    it 'sends summary and params to get' do
      client.should_receive(:get).with 'stream/summary', { channel: 'test' }
      client.summary channel: 'test'
    end
  end

  describe '#list' do
    it 'sends list and params to get' do
      client.should_receive(:get).with 'stream/list', { channel: 'test' }
      client.list channel: 'test'
    end
  end

  describe '#search' do
    it 'sends search and params to get' do
      client.should_receive(:get).with 'stream/search/test%20ruby.json',
        { limit: 50 }
      client.search 'test ruby', limit: 50
    end
  end
end
