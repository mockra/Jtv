require_relative '../../lib/jtv/channel'

class Client; include Jtv::Channel; end

describe Jtv::Channel do
  let(:client) { Client.new }

  describe '#channel_show' do
    it 'sends path with user to get' do
      client.should_receive(:get).with 'channel/show/test.json'
      client.channel_show 'test'
    end
  end

  describe '#fans' do
    it 'sends fans and params to get' do
      client.should_receive(:get).with 'channel/fans/test.json',
        { channel: 'test' }
      client.fans channel: 'test'
    end
  end

  describe '#archives' do
    it 'sends archives and params to get' do
      client.should_receive(:get).with 'channel/archives/test.json',
        { id: 'test' }
      client.archives id: 'test'
    end
  end

  describe '#embed' do
    it 'sends :get, embed path with login and params to request' do
      client.should_receive(:request).with(:get, 'channel/embed/test',
        { volume: 50 }).and_return({})
      client.embed 'test', volume: 50
    end
  end

  describe '#chat_embed' do
    it 'sends :get, chat_embed path with login and params to request' do
      client.should_receive(:request).with(:get, 'channel/chat_embed/justin',
        { height: 50 }).and_return({})
      client.chat_embed 'justin', height: 50
    end
  end
end
