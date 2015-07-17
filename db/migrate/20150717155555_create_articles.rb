class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :subtitle
      t.string :content
      t.boolean :published
      t.boolean :featured
      t.string :meta_description

      t.timestamps
    end
  end
end
