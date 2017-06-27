class CreateConfessions < ActiveRecord::Migration[5.0]
  def change
    create_table :confessions do |t|
      t.string :fullname
      t.string :nickname
      t.text :confession
      t.string :user_id
      t.string :confessionimage

      t.timestamps
    end
  end
end
