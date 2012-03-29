require 'spec_helper'

describe JtvClip do

  describe 'initialize' do

    it 'should create a clip' do
      clip = JtvClip.new( 1278312 )
      clip.should be_a JtvClip
    end

    it 'should set the correct length' do
      clip = JtvClip.new( 1278312 )
      clip.length.should == 22
    end

  end

end

