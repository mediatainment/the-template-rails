class Role < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged

  attr_accessible :name, :roles, :role_id

  has_and_belongs_to_many :users

  validates_presence_of :name

end
