class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.references :amitian, index: true
      t.references :notified_by, index: true
      t.references :confession, index: true
      t.string :notice_type
      t.integer :identifier
      t.boolean :read, default: false

      t.timestamps
    end
    add_foreign_key :notifications, :amitians
    add_foreign_key :notifications, :amitians, column: :notified_by_id
    add_foreign_key :notifications, :confessions
  end
end
