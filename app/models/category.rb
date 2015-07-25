class Category < ActiveRecord::Base
  extend FriendlyId

  attr_accessible :name

  validates_presence_of :name

  friendly_id :name,use: [:slugged, :finders]

  translates :name
end
