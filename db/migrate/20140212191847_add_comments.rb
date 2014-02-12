class AddComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.references :post
      t.string     :body, null: false
      t.timestamps
    end
  end

  def down
    drop_table :comments
  end
end
