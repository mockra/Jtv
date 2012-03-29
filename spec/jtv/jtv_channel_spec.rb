require 'spec_helper'

describe JtvChannel do

  describe 'initialize' do

    it 'should create a channel' do
      channel = JtvChannel.new( 'mockra' )
      channel.should be_a JtvChannel
    end

  end

end
