class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings, id: false do |t|
      t.primary_key :id
      t.string :name

      t.timestamps
    end
  end
end
