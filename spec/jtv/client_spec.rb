require_relative '../../lib/jtv/client'

describe Jtv::Client do
  let(:client) { Jtv::Client.new }
  let(:request) { Object.new }

  describe '#get' do
    it 'fetches JSON based on method, path, and params' do
      client.should_receive(:get_json).with(:get, '/test/', {})
      client.get '/test/'
    end
  end

  context 'when including defaults' do
    it 'has access to oauth details' do
      expect(client).to respond_to :oauth_token
    end
  end

  context 'when including stream' do
    it 'has access to summary, list, and search' do
      expect(client).to respond_to :summary
      expect(client).to respond_to :list
      expect(client).to respond_to :search
    end
  end

  context 'when including user' do
    it 'has access to show and favorites' do
      expect(client).to respond_to :user_show
      expect(client).to respond_to :favorites
    end
  end
end
