class DropMercuryImagesTable < ActiveRecord::Migration
  def up
    drop_table :mercury_images
  end

  def down

    create_table "mercury_images", :force => true do |t|
      t.datetime "created_at",         :null => false
      t.datetime "updated_at",         :null => false
      t.string   "name"
      t.string   "image"
      t.string   "image_url"
      t.string   "image_file_name"
      t.string   "image_content_type"
      t.string   "image_file_size"
      t.datetime "image_updated_at"
      t.string   "width"
      t.string   "height"
    end

    add_index "mercury_images", ["name"], :name => "index_mercury_images_on_name"

  end
end
