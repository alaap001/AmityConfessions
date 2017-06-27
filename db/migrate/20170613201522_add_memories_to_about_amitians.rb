class AddMemoriesToAboutAmitians < ActiveRecord::Migration[5.0]
  def change
    add_column :about_amitians, :memories, :text
  end
end
