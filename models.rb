class User < ActiveRecord::Base
    has_many :posts
    has_many :comments
end

class Post < ActiveRecord::Base
    belongs_to :users
    has_many :comments
end

class Comment < ActiveRecord::Base
    has_many :users
    belongs_to :posts
end

# ======= users =======
# username, password, firstname, lastname, email, interest, created_at

# ======= posts =======
# user_id, comment_id, title, content, created_at

# ======= comments =======
# post_id, user_id, text, created_at
