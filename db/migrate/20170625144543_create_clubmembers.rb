class CreateClubmembers < ActiveRecord::Migration[5.0]
  def change
    create_table :clubmembers do |t|
      t.references :club, foreign_key: true
      t.references :amitian, foreign_key: true

      t.timestamps
    end
  end
end
