class CreateNearestfits < ActiveRecord::Migration
  def change
    create_table :nearestfits do |t|
      t.float :latitude
      t.float :longitude
      t.string :name

      t.timestamps
    end
  end
end
