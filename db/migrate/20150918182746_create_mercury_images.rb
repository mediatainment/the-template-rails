class CreateMercuryImages < ActiveRecord::Migration
  def change
    create_table :mercury_images do |t|
      t.string :mercury_images
      t.string :image
      t.string :width
      t.string :height

      t.timestamps
    end
  end
end
