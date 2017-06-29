class User < ActiveRecord::Base
    has_many :post
end

class Post < ActiveRecord::Base
    has_many :user
end

# ======= users =======
# username, password, firstname, lastname, email, interest, created_at

# ======= posts =======


# ======= comments =======
