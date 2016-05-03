class CreateNearestparkings < ActiveRecord::Migration
  def change
    create_table :nearestparkings do |t|
      t.float :latitude
      t.float :longitude
      t.string :name

      t.timestamps
    end
  end
end
