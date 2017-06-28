class CreatePostsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
            t.string :user_id
            t.string :title
            t.string :content, limit: 150
            t.datetime :created_at
        end
  end
end
