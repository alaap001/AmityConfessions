class AddPostidToConfession < ActiveRecord::Migration[5.0]
  def change
    add_column :confessions, :postid, :string
  end
end
