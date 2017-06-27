class AddGenderToAmitians < ActiveRecord::Migration[5.0]
  def change
    add_column :amitians, :gender, :string
  end
end
