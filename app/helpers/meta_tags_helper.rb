module MetaTagsHelper

  # set default meta tags for meta-tags gem
  def default_meta_tags
    {
        :title => 'Mediatainment Productions',
        :description => 'The Multimedia and Entertainment Agency',
        :keywords => 'programming, fullstack web development, customized, concepts, sustainability, inventions, creativity, video production, audio production',
        :separator => "&mdash;".html_safe,
        :author => 'Jan Jezek'
    }
  end

end