class RemoveBodyAndNameAndContentFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :content
    remove_column :posts, :name
    remove_column :posts, :body
  end

  def down
    add_column :posts, :body, :text
    add_column :posts, :name, :string
    add_column :posts, :content, :text
  end
end
