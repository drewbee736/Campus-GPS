class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.string :path_id
      t.string :location_id_start
      t.string :location_id_end
      t.integer :distance

      t.timestamps
    end
  end
end
