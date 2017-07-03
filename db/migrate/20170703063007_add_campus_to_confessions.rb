class AddCampusToConfessions < ActiveRecord::Migration[5.0]
  def change
    add_column :confessions, :campus_confession, :string
  end
end
