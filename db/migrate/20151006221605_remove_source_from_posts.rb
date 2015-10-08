class RemoveSourceFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :source
  end

  def down
    add_column :posts, :source, :string
  end
end
