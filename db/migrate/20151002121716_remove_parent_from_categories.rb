class RemoveParentFromCategories < ActiveRecord::Migration
  def up
    remove_column :categories, :parent
  end

  def down
    add_column :categories, :parent, :string
  end
end
