class AddUidToUser < ActiveRecord::Migration
  def change
    add_column :users, :dropbox_id, :integer
  end
end
