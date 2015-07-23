class RenameMercuryContentKindToType < ActiveRecord::Migration
  def change
    rename_column :mercury_contents, :kind, :type
  end
end
