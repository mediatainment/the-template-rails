class Content < ActiveRecord::Base
  include FriendlyId

  attr_accessible :name, :kind, :value

  friendly_id :name

end
