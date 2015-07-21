class AddIndexToMercuryContentsName < ActiveRecord::Migration
  def change
    add_index :mercury_contents, :name
  end
end
