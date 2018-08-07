class CreateUserAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_addresses do |t|
      t.string :address
      t.string :city
      t.string :pin_no
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
