class AddSlugToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :slug, :string
  end
end
