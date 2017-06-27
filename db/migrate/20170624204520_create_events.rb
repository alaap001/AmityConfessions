class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :amitian_id
      t.string :eventtheme
      t.string :location
      t.datetime :start
      t.datetime :end
      t.text :description
      t.string :tags
      t.string :event_themepic
      t.string :department
      t.string :niche
      t.integer :club_id

      t.timestamps
    end
  end
end
