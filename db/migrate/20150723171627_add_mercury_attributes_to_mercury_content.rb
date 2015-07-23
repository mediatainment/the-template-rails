class AddMercuryAttributesToMercuryContent < ActiveRecord::Migration
  def change
    add_column :mercury_contents, :settings, :string
  end
end
