# rake db:initialize:admin
namespace :admin do
  namespace :rescue do
    desc "Generates admin with username demo@demo.com and password asdfasdf1."

    task :init => %w(environment) do

      current_admin = User.where(email: "admin@admin.com").first rescue false
      current_admin.destroy if current_admin

      admin = User.new username: "admin",
                       email: "admin@admin.com",
                       password: "asdfasdf1"

      Role.find_or_create_by_slug('admin', name: 'admin')

      admin.roles << Role.where(slug: "admin").first
      admin.save!
    end
  end
end