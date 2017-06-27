class AddAmitianIdToFeedbacks < ActiveRecord::Migration[5.0]
  def change
    add_column :feedbacks, :amitian_id, :integer
  end
end
