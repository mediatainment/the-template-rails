class AddNameAndImageUrlToMercuryImages < ActiveRecord::Migration
  def change
    add_column :mercury_images, :name, :string
    add_column :mercury_images, :image_url, :string
    add_index :mercury_images, :name
  end
end
