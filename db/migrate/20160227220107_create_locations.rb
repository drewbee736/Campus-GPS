class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :location_id
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
