class AddAttributesToMercuryContent < ActiveRecord::Migration
  def change
    add_column :mercury_contents, :attributes, :text
  end
end
