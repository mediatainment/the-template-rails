class AddSnippetsToContent < ActiveRecord::Migration
  def change
    add_column :contents, :snippets, :string
  end
end
