class CreatePostsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
            t.integer :user_id
            t.integer :comment_id
            t.string :title
            t.string :content, limit: 150
            t.datetime :created_at
        end
  end
end
