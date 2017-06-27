class CreateConfessioncomments < ActiveRecord::Migration[5.0]
  def change
    create_table :confessioncomments do |t|
      t.integer :amitian_id
      t.string :content
      t.integer :confession_id

      t.timestamps
    end
  end
end
