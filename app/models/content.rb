class Content < ActiveRecord::Base
  include FriendlyId

  attr_accessible :name, :kind, :value, :snippets

  friendly_id :name

  serialize :snippets, Hash

  def extract_params
    value.gsub!(/\[snippet_\d+\/\d*\]/).with_index do |txt, idx|
      snippets[txt]
    end
  end
end
