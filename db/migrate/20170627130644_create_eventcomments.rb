class CreateEventcomments < ActiveRecord::Migration[5.0]
  def change
    create_table :eventcomments do |t|
      t.references :eventpost, foreign_key: true
      t.references :amitian, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
