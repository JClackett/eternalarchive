class CreateContributionsCategories < ActiveRecord::Migration
  def change
    create_table :contributions_categories do |t|
      t.integer :contributions_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
