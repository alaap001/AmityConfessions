class CreateEventmembers < ActiveRecord::Migration[5.0]
  def change
    create_table :eventmembers do |t|
      t.references :event, foreign_key: true
      t.references :amitian, foreign_key: true

      t.timestamps
    end
     add_index :eventmembers, [:event_id, :amitian_id], unique: true
  end
end
