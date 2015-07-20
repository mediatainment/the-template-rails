module MercuryHelper

  @@mercury_snippets = Hash.new

  # renders a mercury dynamic content
  # kind can be :full, :simple, :markdown, :snippets, :image
  def make_mercury(id, which_tag=:div, kind=:simple)
    content = Content.find_or_create_by_name(id)
    content_tag(which_tag, id: id, data: {mercury: kind.to_s, contenteditable: 'true'}) do
      render_with_snippet(content).html_safe
    end.html_safe
  end

  def render_with_snippet(content)
    if content.value =~ /\[snippet_\d+\/*\d*\]/
      content.value.gsub(/\[snippet_\d+\/*\d*\]/) do |txt|
        snippet = content.snippets[txt.delete "[]"]
        if snippet
          render(:file => "mercury/snippets/#{snippet[:name]}/preview.html", locals: {params: snippet})
        end
      end
    else
      content.value.html_safe
    end
  end

  def self.options_for_snippet
    {snippet_0: {name: 'example', options: [{'favorite_beer' => "Bells Hopslam"}, {'first_name' =>"Jeremy"}]}}.to_json.gsub(/\"/,'')
  end
end