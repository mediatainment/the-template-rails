module LanguageHelper

  def url_without_locale
    "#{request.protocol}#{request.host_with_port}#{request.fullpath.gsub(/^\/(en|de)\//, "/")}"
  end

  # list item style for language
  def language_items
    html = "<ul>"

    I18n.available_locales.each do |lang|
      html << "<li>#{lang.to_s}</li>"
    end

    html << "</ul>"

    return raw html
  end

end