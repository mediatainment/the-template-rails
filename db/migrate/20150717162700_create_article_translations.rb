class CreateArticleTranslations < ActiveRecord::Migration
  def up
    change_column :articles, :content, :text
    Article.create_translation_table!({title: :string, content: :text}, {migrate_data: true})
  end

  def down
    change_column :articles, :content, :string
    Article.drop_translation_table! migrate_data: true
  end
end
