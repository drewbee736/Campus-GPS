class AddDescriptionToPath < ActiveRecord::Migration
  def change
    add_column :paths, :description, :string
  end
end
