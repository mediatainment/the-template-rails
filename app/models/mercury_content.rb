class MercuryContent < ActiveRecord::Base
  include FriendlyId

  attr_accessible :name, :kind, :value, :snippets
  before_validation :default_values

  validates_presence_of :value, :kind, :name

  friendly_id :name

  serialize :snippets, Hash

  def extract_params
    value.gsub!(/\[snippet_\d+\/\d*\]/).with_index do |txt, idx|
      snippets[txt]
    end
  end

  private

  def default_values
    self.value ||= "Dummy Text"
  end

end
