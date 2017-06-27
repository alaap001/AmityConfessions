class CreateClubposts < ActiveRecord::Migration[5.0]
  def change
    create_table :clubposts do |t|
      t.references :club, foreign_key: true
      t.references :amitian, foreign_key: true
      t.text :content
      t.string :clubpost_image

      t.timestamps
    end
  end
end
