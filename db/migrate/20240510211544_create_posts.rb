class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :slug
      t.string :post_image
      t.integer :user_id
      t.string :type
      t.string :content_link

      t.timestamps
    end

    add_index :posts, :slug, unique: true
  end
end
