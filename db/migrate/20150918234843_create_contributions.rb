class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.string :contribution_url
      t.string :contribution_category

      t.timestamps null: false
    end
  end
end
