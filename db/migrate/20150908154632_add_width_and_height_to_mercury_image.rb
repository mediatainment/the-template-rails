class AddWidthAndHeightToMercuryImage < ActiveRecord::Migration
  def change
    add_column :mercury_images, :width, :string
    add_column :mercury_images, :height, :string
  end
end
