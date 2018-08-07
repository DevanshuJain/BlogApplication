class AddBlogsToBlog < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :blogs, :string
  end
end
