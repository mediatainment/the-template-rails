class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :name
      t.text :value
      t.string :kind

      t.timestamps
    end
  end
end
