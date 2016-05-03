class DropUniverse < ActiveRecord::Migration
  def change
    drop_table :universes
  end
end
