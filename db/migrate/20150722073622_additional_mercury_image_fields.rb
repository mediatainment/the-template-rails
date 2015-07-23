class AdditionalMercuryImageFields < ActiveRecord::Migration
  def up
    add_column :mercury_images, :image_file_name, :string
    add_column :mercury_images, :image_content_type, :string
    add_column :mercury_images, :image_file_size, :string
    add_column :mercury_images, :image_updated_at, :datetime
  end

  def down
    remove_column :mercury_images, :image_file_name
    remove_column :mercury_images, :image_content_type
    remove_column :mercury_images, :image_file_size
    remove_column :mercury_images, :image_updated_at
  end
end
