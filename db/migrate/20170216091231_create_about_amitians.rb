class CreateAboutAmitians < ActiveRecord::Migration[5.0]
  def change
    create_table :about_amitians do |t|
      t.text :bio
      t.string :catch_phrase
      t.string :dob
      t.string :interest
      t.string :relationship_status
      t.integer :amitian_id

      t.timestamps
    end
  end
end
