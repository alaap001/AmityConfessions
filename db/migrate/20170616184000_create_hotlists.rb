class CreateHotlists < ActiveRecord::Migration[5.0]
  def change
    create_table :hotlists do |t|
      t.integer :hotlister_id
      t.integer :hotlisted_id

      t.timestamps
    end

add_index :hotlists , :hotlister_id
add_index :hotlists , :hotlisted_id
add_index :hotlists , [:hotlisted_id , :hotlister_id] , unique: true

  end
end
