class AddImageUrlToMercuryImage < ActiveRecord::Migration
  def change
    add_column :mercury_images, :image_url, :string
  end
end
