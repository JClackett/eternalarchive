class CreatePostsCategories < ActiveRecord::Migration
  def change
    create_table :posts_categories do |t|
      t.integer :category
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
