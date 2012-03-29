require 'spec_helper'

describe Jtv do

  describe 'JtvClient' do

    it 'should set the consumer_key' do
      pending('Need to test the environment variables')
      Jtv::JtvClient::CONSUMER_KEY.should == ENV['JTV_CONSUMER_KEY']
    end

    it 'should create a client' do
      client = Jtv::JtvClient.new
      client.should be_a Jtv::JtvClient
    end

    describe 'get' do

      it 'should return Net::HTTPOK' do
        client = Jtv::JtvClient.new
        data = client.get( '/stream/list.json' )
        data.should be_a(Net::HTTPOK)
      end

    end

  end

end
