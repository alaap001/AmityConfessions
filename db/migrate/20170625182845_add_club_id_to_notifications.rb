class AddClubIdToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_reference :notifications, :club, foreign_key: true
  end
end
