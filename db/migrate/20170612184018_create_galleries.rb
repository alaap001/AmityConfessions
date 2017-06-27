class CreateGalleries < ActiveRecord::Migration[5.0]
  def change
    create_table :galleries do |t|
      t.string :g1
      t.string :g2
      t.string :g3
      t.string :g4
      t.string :g5
      t.string :g6

      t.timestamps
    end
  end
end
