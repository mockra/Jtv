require_relative '../../lib/jtv/client'

describe Jtv::Client do
  let(:client) { Jtv::Client.new }
  let(:request) { Object.new }

  describe '#get' do
    it 'sends get to request with path and params' do
      client.should_receive(:request).with(:get, '/test/', {})
      client.get '/test/'
    end
  end

  context 'when including defaults' do
    it 'has access to oauth details' do
      expect(client).to respond_to :oauth_token
      expect(client).to respond_to :oauth_secret
    end
  end
end
