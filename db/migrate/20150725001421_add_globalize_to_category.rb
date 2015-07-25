class AddGlobalizeToCategory < ActiveRecord::Migration
  def change
    Category.create_translation_table! :name => :string
  end
end
