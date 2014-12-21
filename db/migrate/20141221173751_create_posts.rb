class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :group_id
      t.text :content

      t.timestamps null: false
    end
  end
end
