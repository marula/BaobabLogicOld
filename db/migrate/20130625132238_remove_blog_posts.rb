class RemoveBlogPosts < ActiveRecord::Migration
  def change
    drop_table :blogs
  end
end
