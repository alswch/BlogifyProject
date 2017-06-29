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
INSERT INTO posts (user_id, title, content, created_at) VALUES (1, "First Post", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et viverra ex, et lobortis turpis. Phasellus vel malesuada enim, in ultrices sapien. Suspendisse gravida venenatis tellus, sit amet tincidunt ligula commodo sed. Phasellus a purus tempus, lacinia elit eu, porttitor orci. In lobortis blandit tincidunt. Sed maximus non dui ut ultricies. Maecenas sit amet vehicula urna. Maecenas fringilla suscipit tortor eu sagittis.", current_timestamp);
INSERT INTO posts (user_id, title, content, created_at) VALUES (1, "Etiam gravida", "Etiam gravida blandit neque ac consequat. In egestas bibendum eleifend. Vestibulum quis mauris sit amet metus fermentum convallis ac porttitor enim. Curabitur pulvinar est nisl, nec scelerisque magna sodales sit amet. Pellentesque facilisis augue a sagittis luctus. Phasellus vitae est dui. Sed non tempor neque. Aliquam erat volutpat.", current_timestamp);
INSERT INTO posts (user_id, title, content, created_at) VALUES (1, "In lorem sem", "In lorem sem, rutrum ut massa et, sodales placerat diam. Praesent a metus tellus. Sed dolor felis, porttitor nec metus id, aliquet varius erat. Mauris finibus blandit finibus. Aliquam tellus lectus, mollis vitae metus at, sagittis consectetur dolor. Sed maximus ante nec lorem viverra hendrerit. Phasellus finibus pretium velit, malesuada accumsan sapien aliquet quis. Maecenas vitae ullamcorper nisi, id pharetra nunc. Curabitur posuere tristique felis non tincidunt. Suspendisse tempus, libero aliquet feugiat scelerisque, urna leo interdum turpis, a fermentum eros justo sed est.", current_timestamp);

# ======= comments =======
# post_id, user_id, text, created_at
