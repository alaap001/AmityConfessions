class AddCampusToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :campus_event, :string
  end
end
