class AddBioToAmitians < ActiveRecord::Migration[5.0]
  def change
    add_column :amitians, :bio, :text
  end
end
