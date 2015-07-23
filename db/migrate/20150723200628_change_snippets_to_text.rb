class ChangeSnippetsToText < ActiveRecord::Migration
  def change
    change_column :mercury_contents, :snippets, :text
  end
end
