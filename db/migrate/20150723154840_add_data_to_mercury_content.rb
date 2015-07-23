class AddDataToMercuryContent < ActiveRecord::Migration
  def change
    add_column :mercury_contents, :data, :text
  end
end
