class RenameContentToMercuryContent < ActiveRecord::Migration
  def up
    rename_table :contents, :mercury_contents
  end

  def down
    rename_table :mercury_contents, :contents
  end
end
