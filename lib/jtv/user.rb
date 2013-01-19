module Jtv
  module User
    def user_show id
      get "user/show/#{id}.json"
    end

    def favorites id
      get "user/favorites/#{id}.json"
    end
  end
end
