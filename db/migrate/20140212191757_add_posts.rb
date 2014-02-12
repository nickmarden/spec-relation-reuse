class AddPosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.string :subject, null: false
      t.string :body,    null: false
      t.timestamps
    end
  end

  def down
    drop_table :posts
  end
end
