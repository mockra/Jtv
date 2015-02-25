require_relative '../../lib/jtv/channel'

class Client; include Jtv::Channel; end

describe Jtv::Channel do
  let(:client) { Client.new }

  describe '#channel_show' do
    it 'sends path with user to get' do
      expect(client).to receive(:get).with 'channels/test.json'
      client.channel_show 'test'
    end
  end

  describe '#fans' do
    it 'sends fans and params to get' do
      expect(client).to receive(:get).with 'channels/test/follows.json',
        { channel: 'test' }
      client.fans channel: 'test'
    end
  end

  describe '#archives' do
    it 'sends archives and params to get' do
      expect(client).to receive(:get).with 'channels/test/videos.json',
        { id: 'test' }
      client.archives id: 'test'
    end
  end
end
