class AddNameToPosts < ActiveRecord::Migration
  def change
    Post.reset_column_information
    add_column :posts, :name, :string
  end
end
