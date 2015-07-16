class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :lockable,
         :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :role_ids, :roles_ids
  # attr_accessible :title, :body

  has_and_belongs_to_many :roles, autosave: true

  def list_of_roles
    (roles.map { |role| role.slug }) rescue []
  end

  def admin?
    list_of_roles.include?('admin')
  end

end
