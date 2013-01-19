require_relative '../../lib/jtv/user'

class Client; include Jtv::User; end

describe Jtv::User do
  let(:client) { Client.new }

  describe '#user_show' do
    it 'sends path with user to get' do
      client.should_receive(:get).with 'user/show/test.json'
      client.user_show 'test'
    end
  end

  describe '#favorites' do
    it 'sends favorites path with user to get' do
      client.should_receive(:get).with 'user/favorites/test.json'
      client.favorites 'test'
    end
  end
end
