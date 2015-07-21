module MercuryHelper

  # renders a mercury dynamic content
  # kind can be :full, :simple, :markdown, :snippets, :image
  def make_mercury(id, which_tag=:div, kind=:simple)
    content = Content.find_or_create_by_name(id)
    content_tag(which_tag, id: id, data: {mercury: kind.to_s, contenteditable: 'true'}) do
      render_with_snippet(content).html_safe
    end.html_safe
  end

  # parses snippets and replace it in text
   def render_with_snippet(content)
     snippet_regex = /\[snippet_\d+\/*\d*\]/
    if content.value =~ snippet_regex
      content.value.gsub(snippet_regex) do |txt|
        cleaned_snippet = txt.delete "[]" # delete brackets
        snippet = content.snippets[cleaned_snippet]
        if snippet
          render(:file => "mercury/snippets/#{snippet[:name]}/preview.html", locals: {params: snippet})
        end
      end
    else
      content.value.html_safe
    end
  end

  # this helper links to the editor of the current page
  def mercury_edit_path(path = nil)
    mercury_editor_path(path.nil? ? request.path.gsub(/^\/\/?(editor)?/, '') : path)
  end
end