class AddRolesToClubmembers < ActiveRecord::Migration[5.0]
  def change
    add_column :clubmembers, :roles, :string
  end
end
