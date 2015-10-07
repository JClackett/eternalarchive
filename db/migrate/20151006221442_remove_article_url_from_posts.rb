class RemoveArticleUrlFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :article_url
  end

  def down
    add_column :posts, :article_url, :string
  end
end
