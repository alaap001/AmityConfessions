class AddLastSignOutAtToAmitians < ActiveRecord::Migration[5.0]
  def change
    add_column :amitians, :last_sign_out_at, :datetime
  end
end
