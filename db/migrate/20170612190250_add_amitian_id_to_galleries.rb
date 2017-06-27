class AddAmitianIdToGalleries < ActiveRecord::Migration[5.0]
  def change
    add_column :galleries, :amitian_id, :integer 
  end
end
