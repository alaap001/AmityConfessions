class AddCoverToAmitians < ActiveRecord::Migration[5.0]
  def change
    add_column :amitians, :cover, :string
  end
end
