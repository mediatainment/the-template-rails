module MercuryHelper

  def make_mercury(id, which_tag=:div, kind=:simple)
    content = Content.find_or_create_by_name(id)
    content_tag(which_tag, id: id, data: {mercury: kind.to_s}) do
      content.value if content
    end.html_safe
  end
end