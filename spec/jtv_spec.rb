require 'spec_helper'

describe Jtv do
  let(:client) { Jtv::Client.new }

  describe '.client' do
    it 'initialize a Jtv::Client' do
      expect(Jtv.client).to be_a Jtv::Client
    end
  end

  context 'when including configuration' do
    it 'responds to configure' do
      Jtv.configure do |config|
        config.consumer_key = 'key'
      end
      expect(Jtv.consumer_key).to eq 'key'
    end
  end

  context 'when delegating to client' do
    before do
      allow(Jtv).to receive(:client).and_return client
    end

    it 'calls the correct method on client' do
      expect(client).to receive(:get).with '/test'
      Jtv.get '/test'
    end

    it "raises an error for methods client can't respond to" do
      expect { Jtv.fake_method }.to raise_error NoMethodError
    end
  end
end
