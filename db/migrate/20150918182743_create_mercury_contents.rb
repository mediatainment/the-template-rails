class CreateMercuryContents < ActiveRecord::Migration
  def change
    create_table :mercury_contents do |t|
      t.string :mercury_contents
      t.string :name
      t.text :value
      t.string :type
      t.text :data
      t.string :slug
      t.text :settings
      t.string :width
      t.string :height

      t.timestamps
    end
    add_index :mercury_contents, :name, :unique => true
  end
end
