class RemoveColumnAttributesFromMercuryContent < ActiveRecord::Migration
  def change
    remove_column :mercury_contents, :attributes
  end
end
