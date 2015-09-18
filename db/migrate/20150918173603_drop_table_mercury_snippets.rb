class DropTableMercurySnippets < ActiveRecord::Migration
  def up
    drop_table :mercury_snippets
  end

  def down

    create_table "mercury_snippets", :force => true do |t|
      t.text "snippet"
      t.text "name"
    end

    add_index "mercury_snippets", ["name"], :name => "index_mercury_snippets_on_name"

  end
end
