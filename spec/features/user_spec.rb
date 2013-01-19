require 'spec_helper'
require 'vcr_config'

describe Jtv::User do
  describe '#user_show' do
    use_vcr_cassette

    it 'fetches information on user' do
      user = Jtv.user_show 'augury'
      expect(user['login']).to eq 'augury'
    end
  end

  describe '#favorites' do
    use_vcr_cassette

    it 'fetches favorites from user' do
      user = Jtv.favorites 'augury'
      expect(user.first['language']).to eq 'en'
    end
  end
end
