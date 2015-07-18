class Article < ActiveRecord::Base
  extend FriendlyId

  attr_accessible :content, :featured, :meta_description, :published, :subtitle, :title

  translates :title, :content

  friendly_id :title, use: :slugged

end
