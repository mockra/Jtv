require 'spec_helper'
require 'vcr_config'

describe Jtv::User do
  describe '#user_show', :vcr do
    it 'fetches information on user' do
      user = Jtv.user_show 'augury'
      expect(user['display_name']).to eq 'Augury'
    end
  end
end
