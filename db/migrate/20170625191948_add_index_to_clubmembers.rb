class AddIndexToClubmembers < ActiveRecord::Migration[5.0]
  def change
 add_index :clubmembers, [:amitian_id,:club_id], unique: true
  end
end
