class AddFullnameToAmitians < ActiveRecord::Migration[5.0]
  def change
    add_column :amitians, :fullname, :string
    add_column :amitians, :nickname, :string
    add_column :amitians, :profilepic, :string
  end
end
