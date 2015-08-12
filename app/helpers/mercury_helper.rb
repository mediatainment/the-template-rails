module MercuryHelper

  # renders a mercury dynamic content
  # type can be :full, :simple, :markdown, :snippets, :image
  def make_mercury(id, kind=:simple, surrounded_tag=:div, i18n=false, size='100%xauto')
    id = localize_id(id) if i18n
    content = MercuryContent.find_or_create_by_name_and_type(id, kind)

    if kind == :image
      assign_dimensions(content, size)
      mercury_image_tag(content)
    else
      render_mercury_tag(content, id, kind, surrounded_tag)
    end
  end

  # renders a mercury image tag
  # use make_mercury for creation
  def mercury_image_tag(mercury_image)
    image_settings = mercury_image.settings[:src]
    image_source = image_settings.blank? ? 'no_image_defined.png' : image_settings
    image_tag image_source, id: mercury_image.name,
              data: {mercury: mercury_image.type, contenteditable: 'true'},
              alt: "#{mercury_image.name}-#{mercury_image.width}x#{mercury_image.height}",
              width: mercury_image.width,
              height: mercury_image.height
  end

  # renders a mercury tag
  # use make_mercury for creation
  def render_mercury_tag(content, id, type, which_tag)
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

  private

  def assign_dimensions(content, size)
    return unless size

    dimensions = size.split('x')
    content.update_attributes(width: dimensions.first, height: dimensions.last)
  end
end