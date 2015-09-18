class MercurySnippet < ActiveRecord::Migration
  def up
    create_table :mercury_snippets do |t|
      t.text 'snippet'
      t.text 'name'
    end
  end

  def down
    drop_table :mercury_snippets
  end
end
