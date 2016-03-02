class CreateIntersections < ActiveRecord::Migration
  def change
    create_table :intersections do |t|
      t.string :path_id_start
      t.string :path_id_end
      t.string :direction

      t.timestamps
    end
  end
end
