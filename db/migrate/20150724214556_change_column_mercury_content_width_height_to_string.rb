class ChangeColumnMercuryContentWidthHeightToString < ActiveRecord::Migration
  def change
    change_column :mercury_contents, :width, :string
    change_column :mercury_contents, :height, :string
  end
end
