class DropMercuryContentsTable < ActiveRecord::Migration
  def up
    drop_table :mercury_contents
  end

  def down

    create_table "mercury_contents", :force => true do |t|
      t.string   "name"
      t.text     "value",      :limit => 16777215
      t.string   "type"
      t.datetime "created_at",                     :null => false
      t.datetime "updated_at",                     :null => false
      t.string   "slug"
      t.text     "snippets"
      t.text     "data"
      t.string   "settings"
      t.string   "width"
      t.string   "height"
    end

    add_index "mercury_contents", ["name"], :name => "index_mercury_contents_on_name"
    add_index "mercury_contents", ["slug"], :name => "index_contents_on_slug", :unique => true

  end
end
