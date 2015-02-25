module Jtv
  module User
    def user_show id
      get "users/#{id}.json"
    end
  end
end
