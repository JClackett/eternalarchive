class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.string :url
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
