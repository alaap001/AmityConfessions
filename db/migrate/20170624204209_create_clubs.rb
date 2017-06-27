class CreateClubs < ActiveRecord::Migration[5.0]
  def change
    create_table :clubs do |t|
      t.integer :amitian_id
      t.string :name , unique: true
      t.string :club_theme
      t.text :description
      t.string :club_themepic
      t.string :club_cover
      t.string :niche
      t.string :website

      t.timestamps
    end
  end
end
