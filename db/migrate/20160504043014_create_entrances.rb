class CreateEntrances < ActiveRecord::Migration
  def change
    create_table :entrances do |t|
      t.integer :node_num
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
