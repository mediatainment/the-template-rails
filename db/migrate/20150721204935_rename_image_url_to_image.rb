class RenameImageUrlToImage < ActiveRecord::Migration
  def change
    rename_column :mercury_images, :image_url, :image
  end
end
