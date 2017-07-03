class AddCampusToClubs < ActiveRecord::Migration[5.0]
  def change
    add_column :clubs, :campus_club, :string
  end
end
