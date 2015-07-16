module MetaTagsHelper

  def default_meta_tags
    {
        :title => 'Mediatainment Productions',
        :description => 'The Multimedia and Entertainment Agency',
        :keywords => 'programming, customization, concepts, sustainability, inventions, creativity, fullstack web development, video production, audio production',
        :separator => "&mdash;".html_safe,
        :author => 'Jan Jezek'
    }
  end

end