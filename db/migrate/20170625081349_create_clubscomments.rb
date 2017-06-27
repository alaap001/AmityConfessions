class CreateClubscomments < ActiveRecord::Migration[5.0]
  def change
    create_table :clubscomments do |t|
      t.references :clubpost, foreign_key: true
      t.references :amitian, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end

