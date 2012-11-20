class AddContentToPosts < ActiveRecord::Migration
  def change
    Post.reset_column_information
    add_column :posts, :body, :text
  end
end
