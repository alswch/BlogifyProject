class User < ActiveRecord::Base
    has_many :post
end

class Post < ActiveRecord::Base
    has_many :user
end
