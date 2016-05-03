class ChangeDining < ActiveRecord::Migration
  def change
    add_column :nearestdinings, :name, :string
  end
end
