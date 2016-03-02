class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :picture_id
      t.string :picture_name
      t.string :picture_url

      t.timestamps
    end
  end
end
