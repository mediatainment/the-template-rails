class CreateMercurySnippets < ActiveRecord::Migration
  def change
    create_table :mercury_snippets do |t|
      t.string :mercury_snippets
      t.text :snippet
      t.string :name

      t.timestamps
    end
    add_index :mercury_snippets, :name, :unique => true
  end
end
