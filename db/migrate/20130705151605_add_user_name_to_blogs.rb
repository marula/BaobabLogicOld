class AddUserNameToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :user_name, :string
  end
end
