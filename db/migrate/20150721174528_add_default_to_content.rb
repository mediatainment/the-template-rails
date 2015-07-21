class AddDefaultToContent < ActiveRecord::Migration
  def change
    change_column :contents, :value, :text, :limit => 16777215, :default => nil, :null => true
  end
end
