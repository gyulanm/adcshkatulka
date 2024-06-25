class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :post_id
      t.string :post_type
      t.integer :user_id
      t.integer :reply_to_comment_id

      t.timestamps
    end
  end
end
