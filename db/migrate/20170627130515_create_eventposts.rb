class CreateEventposts < ActiveRecord::Migration[5.0]
  def change
    create_table :eventposts do |t|
      t.references :event, foreign_key: true
      t.references :amitian, foreign_key: true
      t.text :content
      t.string :event_post_image

      t.timestamps
    end
  end
end
