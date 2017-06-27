class AddAmitianIdToConfessions < ActiveRecord::Migration[5.0]
  def change
    add_column :confessions, :amitian_id, :integer
  end
end
