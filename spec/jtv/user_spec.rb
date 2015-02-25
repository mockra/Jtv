require_relative '../../lib/jtv/user'

class Client; include Jtv::User; end

describe Jtv::User do
  let(:client) { Client.new }

  describe '#user_show' do
    it 'sends path with user to get' do
      expect(client).to receive(:get).with 'users/test.json'
      client.user_show 'test'
    end
  end
end
