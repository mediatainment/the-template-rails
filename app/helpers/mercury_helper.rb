module MercuryHelper

  # renders a mercury dynamic content
  # type can be :full, :simple, :markdown, :snippets, :image
  def make_mercury(id, kind=:simple, surrounded_tag=:div, i18n=false, size='800x600')
    id = localize_id(id) if i18n
    content = MercuryContent.find_or_create_by_name_and_type(id, kind)
    if kind == :image
      if content.height.nil? && content.width.nil?
        dimensions = size.split('x')
        content.update_attributes(height: dimensions.first, width: dimensions.last)
      end
      mercury_image_tag(content)
    else
      render_snippets(content, id, kind, surrounded_tag)
    end
  end

  def mercury_image_tag(content)
    image_tag content.settings[:src], id: content.name,
              data: {mercury: content.type, contenteditable: 'true'},
              alt: content.name,
              :height => content.height,
              :width => content.width
  end

  def render_snippets(content, id, type, which_tag)
    content_tag(which_tag, id: id, data: {mercury: type.to_s, contenteditable: 'true'}) do
      parse_snippets(content).html_safe
    end.html_safe
  end

  # returns id-language
  def localize_id(id)
    id + "-" + I18n.locale.to_s
  end

  # parses snippets and replace it in text
  def parse_snippets(content)
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