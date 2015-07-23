class MercuryContent < ActiveRecord::Base
  include FriendlyId

  self.inheritance_column = nil # to use :data as column_name

  attr_accessible :name, :type, :value, :snippets, :data, :settings, :width, :height
  before_validation :default_values

  validates_presence_of :value, unless: -> (mc) { mc.type == 'image' }
  validates_presence_of :type, :name

  friendly_id :name

  serialize :snippets, Hash
  serialize :data, Hash
  serialize :settings, Hash

  def extract_params
    value.gsub!(/\[snippet_\d+\/\d*\]/).with_index do |txt, idx|
      snippets[txt]
    end
  end

  private

  def default_values
    self.value ||= " "
  end


end
