class CreateCommentsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
            t.integer :post_id
            t.integer :user_id
            t.string :text, limit: 150
            t.datetime :created_at
        end
  end
end
