class AddHomeNodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :Home_Node, :integer
  end
end
