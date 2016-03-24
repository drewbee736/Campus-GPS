class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes, id: false do |t|
      t.primary_key :id
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
