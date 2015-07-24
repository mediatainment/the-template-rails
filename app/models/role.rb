class Role < ActiveRecord::Base

  extend FriendlyId

  attr_accessible :name, :roles, :role_id

  has_and_belongs_to_many :users

  validates_presence_of :name
  before_destroy :do_not_change_admin_role
  before_update :do_not_change_admin_role

  friendly_id :name, use: :slugged

  private

  def do_not_change_admin_role
    errors.add(:base, "Admin Role cannot be changed") if name == 'admin' || name_change.include?('admin')
    errors.blank? #return false, to not destroy the element, otherwise, it will delete.
  end

end
