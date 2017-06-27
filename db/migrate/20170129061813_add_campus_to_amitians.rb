class AddCampusToAmitians < ActiveRecord::Migration[5.0]
  def change
    add_column :amitians, :campus, :string
    add_column :amitians, :institute, :string
    add_index :amitians, :campus
    add_index :amitians, :institute
  end
end
