require 'spec_helper'

describe JtvSearch do

  describe 'get' do

    it 'should return an array' do
      streams = JtvSearch.get( 'league of legends', 20 )
      streams.should be_a Array
    end

    it 'should allow a search limit' do
      streams = JtvSearch.get( 'league of legends', 4 )
      streams.count.should <= 4
    end

    it 'should work with no search results' do
      query = 'x' * 50
      streams = JtvSearch.get( query )
      streams.count.should == 0
    end

  end

end
