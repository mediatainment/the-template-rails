class MercuryImage < ActiveRecord::Base

  mount_uploader :image, MercuryImageUploader

  attr_accessible :image, :name, :image_url

  #validates_presence_of :name

  def serializable_hash(options = nil)
    options ||= {}
    options[:methods] ||= []
    options[:methods] << :url
    super(options)
  end

  def dimensions
    [width, height]
  end

end
