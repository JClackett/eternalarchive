class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :source
      t.string :url
      t.string :description
      t.string :article_url

      t.timestamps null: false
    end
  end
end
