class AddColumnHeightAndWidthToMercuryContent < ActiveRecord::Migration
  def change
    add_column :mercury_contents, :width, :integer
    add_column :mercury_contents, :height, :integer
  end
end
