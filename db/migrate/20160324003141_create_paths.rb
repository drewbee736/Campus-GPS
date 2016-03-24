class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.integer :start
      t.integer :end
      t.integer :distance

      t.timestamps
    end
  end
end
