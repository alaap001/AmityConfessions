class AddAlumniToAmitians < ActiveRecord::Migration[5.0]
  def change
    add_column :amitians, :alumni, :boolean , default: false
  end
end
