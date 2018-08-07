class AddTextToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :text, :string
  end
end
